({
    doInit : function(component, event, helper) {
        const action = component.get("c.getAllAccounts");
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            const state = response.getState();
            if(state == 'SUCCESS'){
                component.set("v.Accounts", returnValue);
            }
        });
        
        $A.enqueueAction(action);
    },
    onChangeAccount : function(component, event, helper) {
        
        const selectedAccount = component.find("slectedAccountId").get("v.value");
        const lastName = component.get("v.contactName");
        
        const action = component.get("c.createNewContact");
        action.setParams({slectedAcc: selectedAccount, lName: lastName});
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            const state = response.getState();
            if(state == 'SUCCESS'){
                alert(returnValue.LastName + " record are successfully saved!!!..");
                
            }else{
                alert("Something is error !!!..");
            }
        });
        
        $A.enqueueAction(action);
        
    }
})