({
    doInit: function(component, event, helper){
        const actions = component.get("c.ShowOpportunity");
        actions.setCallback(this, function(response){
            const state = response.getState();
            const returnValue = response.getReturnValue();
            if(state == 'SUCCESS'){
                component.set("v.opportunities", returnValue);
            }
        });
        
        $A.enqueueAction(actions);
    },
    updateValue : function(cmp, event, helper){
        const name = event.getSource().get("v.name");
        console.log("this is name value : "+ name);
    },
    UpdateToOpportunity : function(component){
        const selectedOppo = component.find("selectOpportunity").get("v.value");
        const selectedDate = component.get("v.selectedDate");
        
        const action = component.get("c.updateToClosedate");
        action.setParams({OpporId : selectedOppo, closeDate : selectedDate})  ;
        
        //define callback
        action.setCallback(this, function(response){
            const state = response.getState();
            console.log("state : "+state);
            if(state !== 'SUCCESS'){
                console.error("Error in saving record");
            }
        });
        
        // call apex method
        $A.enqueueAction(action);
        
    },
    createAccount : function(component, event, helper) {
        const accountName = component.get("v.AccountName");
        const userName = component.get("v.UserName");
        const password = component.get("v.Password");
        
        const AccountPhoneNumber = component.get("v.PhoneNumb");
        const AccountRating = component.find("rating").get("v.value");
        const accountType = component.find("type").get("v.value");
        const accountIndustry = component.find("industry").get("v.value");
        
        
        // create apex method call
        const action = component.get("c.CreateNewAccount");
        
        //set params  String  AccName, String PhoneNo, String TypeOfAcc, String AccRating , String AccIndustry
        action.setParams({AccName : accountName, PhoneNo : AccountPhoneNumber, TypeOfAcc : accountType, AccRating : AccountRating, AccIndustry : accountIndustry, uName: userName, pswd: password});
        
        //define callback
        action.setCallback(this, function(response){
            const state = response.getState();
            if(state !== 'SUCCESS'){
                console.error("Error in saving record");
            }
        });
        
        // call apex method
        $A.enqueueAction(action);
        
    },
    
})