({
	fetchData : function(cmp, event, setData) {
		 const action = cmp.get("c.callWrapper");
        
        action.setCallback(this, function(response){
            
            const state = response.getState();
            //console.log("returnValue AccName : " + returnValue.AccName);
            
            console.log("state : " + state);
            if(state == "SUCCESS"){
               const returnValue = response.getReturnValue();
               // console.log("returnValue : " + JSON.stringify(returnValue));
                for(var i = 0; i < returnValue.length; i++ ){
                   let eachData = returnValue[i];
                  //  console.log('eachData.AccName : '+eachData.AccName)
                    if(eachData.AccName !== undefined){
                        eachData.accountName = eachData.AccName.Name;
                    }
                    if(eachData.conName !== undefined){
                        eachData.ContactName = eachData.conName.Name;
                    }
                    if(eachData.OpportunityList !== undefined){
                        eachData.opportunityName = eachData.OpportunityList.Name;
                    }
                }
                
                cmp.set("v.Data", returnValue);
                
            }
        });
        
        $A.enqueueAction(action);
	}
})