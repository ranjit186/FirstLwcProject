({
	getAlldata : function(component, event, helper) {
		console.log("call the getAlldata")
        const setValue = component.get("v.dataOfAccount");
        
        console.log("setValue : "+ setValue);
        
        const action = component.get("c.getAllAccRealOppContact");
        console.log("action : "+action);
        
          action.setCallback(this, function(response){
            console.log('response',response.getReturnValue());
              const returnValue = response.getReturnValue();
              
              component.set("v.dataOfAccount", returnValue);
            
        });
        
        
        $A.enqueueAction(action);
        
	}
})