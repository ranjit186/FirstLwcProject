({
    fetchdata : function(component, event){
        const getUserId = event.getParam("acc_Id");
                
        if(getUserId != undefined){
            component.set("v.accId", getUserId);
        }
        const getAccountId = component.get("v.accId");
        if(getAccountId != undefined){
            
            const action = component.get("c.getUserDetails");
            action.setParams({accId : getAccountId});
            action.setCallback(this, function(response){
                const returnValue = response.getReturnValue();
                const state = response.getState();
                console.log("returnValue  : "+JSON.stringify(returnValue));
                if(state == "SUCCESS"){
                    for(let i = 0; i < returnValue.length; i++){
                        const teampvar = returnValue[i];
                        if(teampvar.Account){
                            teampvar.AccountName = teampvar.Account.Name;
                        }
                    }
                    component.set("v.userData", returnValue);
                    component.set("v.showtable", returnValue);
                }
            });
            
            $A.enqueueAction(action);
        }
        
    },
    getRowIndex: function(rows, row) {
        var rowIndex = -1;
        rows.some(function(current, i) {
            if (current.Id === row.Id) {
                rowIndex = i;
                return true;
            }
        });
        return rowIndex;
    },
    removeBook: function (cmp, row) {
        var rows = cmp.get('v.userData');
        var rowIndex = rows.indexOf(row);
        
        if(row.Id != undefined){
            const action  = cmp.get("c.deleteContact");
            
            action.setParams({deleteContacts : row.Id});
            action.setCallback(this, function(response){
                const returnValue = response.getReturnValue();
                
                console.log("setCallback delete : "+ returnValue);
                const state = response.getState();
                
                if(returnValue === true){
                    $A.get('e.force:refreshView').fire();
                }
                
            });
            
            $A.enqueueAction(action);
        }else{
            var rows = cmp.get('v.userData');
            var rowIndex = this.getRowIndex(rows, row);
            rows.splice(rowIndex, 1);
            cmp.set('v.userData', rows);
        }
        
    },
    saveEdition: function (cmp, draftValues) {
        const toastEvent = $A.get("e.force:showToast");
        var self = this;
        // simulates a call to the server, similar to an apex controller.
        console.log("cmp : "+cmp);
        console.log("draftValues : "+JSON.stringify(draftValues));
        const tempvar = [];
        
        draftValues.map((data)=>{
            const splitedId = data.Id.split('-')[0];
            console.log("splitedId : "+splitedId);
            if(splitedId == 'row'){
            delete data.Id;
            data.AccountId = cmp.get("v.accId");
        }
                        })
        const editedRecords = draftValues;
        const totalRecordEdited = editedRecords.length;
        
        
        const action = cmp.get("c.updateContactEdited");
        
        action.setParams({ editedSAList : editedRecords});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //***if update is successful ***
                if(response.getReturnValue() === true){
                    $A.get('e.force:refreshView').fire();
                    
                    toastEvent.setParams({
                        title : 'Info',
                        message: '"somthing is error please!!!..."',
                        duration:' 2000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    
                }
            } 
            else{ 
                //***if update failed ***
                //
                
                toastEvent.setParams({
                    title : 'Info',
                    message: '"somthing is error please!!!..."',
                    duration:' 2000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
                toastEvent.fire();
                
            }
        });
        
        $A.enqueueAction(action);
 
    },
})