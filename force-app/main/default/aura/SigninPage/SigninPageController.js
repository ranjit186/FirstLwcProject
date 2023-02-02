({
    clickToSignIn : function(component, event, helper) {
        const toastEvent = $A.get("e.force:showToast");
        const emailInput = component.get("v.Email");
        const password = component.get("v.password");
        
        const action = component.get("c.searchUser");
        console.log('action : '+action);
        
        action.setParams({email : emailInput, pswd : password});
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            console.log("get response : "+ returnValue);
            //returnValue.map(data =>{
            ///     
            // })
            if(returnValue){
                //alert("Loged In Successfully");
                toastEvent.setParams({
                    title : 'Info',
                    message: 'Loged In Successfully',
                    duration:' 2000',
                    key: 'info_alt',
                    type: 'success',
                    mode: 'pester'
                });
                toastEvent.fire();
                console.log("returnValue.Id : "+ returnValue.Id);
                component.set("v.contId", returnValue.Id);
                component.set("v.ShowDetail", true);
            }else{
               // alert("somthing is error please!!!...");
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
            
            console.log("State : "+ response.getState());
            console.log("get response : "+ JSON.stringify(response.getReturnValue()));
        });
        
        
        $A.enqueueAction(action);
    },
    createNewContact: function(component, event, helper){
        component.set("v.logIn", false);
    },
    
    createContact: function(component, event, helper){
        const firstName = component.get("v.FirstName");
        const lastName = component.get("v.LastName");
        const newEmail = component.get("v.newEmail");
        const newPassword = component.get("v.newPassword");
        console.log('firstName : '+firstName + " lastName : "+ lastName + " newEmail : "+newEmail+ " newPassword : "+ newPassword);
        const action = component.get("c.createNewUser");
        console.log('action : '+action);
        
        action.setParams({FName : firstName, LName : lastName, Email : newEmail, pswd : newPassword});
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            console.log("get response : "+ returnValue);
            //returnValue.map(data =>{
            ///     
            // })
            if(returnValue){
                alert("Loged In Successfully");
                console.log("returnValue.Id : "+ returnValue.Id);
                component.set("v.contId", returnValue.Id);
                component.set("v.ShowDetail", true);
            }else{
                alert("somthing is error please!!!...");
            }
            
            console.log("State : "+ response.getState());
            console.log("get response : "+ JSON.stringify(response.getReturnValue()));
        });
        
        $A.enqueueAction(action);
        
        
    },
    havingAccount : function(component, event, helper){
        component.set("v.logIn", true);
    }
})