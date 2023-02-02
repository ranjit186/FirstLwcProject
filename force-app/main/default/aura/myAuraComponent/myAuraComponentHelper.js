({
    addResultRecord : function(component, gameResult) {
        console.log("call myAuraComonentHelper of apex mthod");
        // create apex method call action
        const action = component.get("c.gameResultInsert");
        console.log("action : --> "+action);
        const gameMode = component.get("v.selectedMode").toUpperCase();

        // set param
        action.setParams({result : gameResult, mode : gameMode});

        // define callback

        action.setCallback(this, function(response){
            console.log('response : '+response);
            // do post processing here
            const state = response.getState();
            console.log("state",JSON.stringify(response));
            if(state !== 'SUCCESS' ){
                console.error("Error in saving record");

            }
        });

        console.log('call apex method');
        // call apex method
        $A.enqueueAction(action);
    },


    getResultReacord : function(component){
        const action = component.get("c.getGameResult");

        console.log("call get method function"+ action);
        //action.setParams();

        action.setCallback(this, function(response){
            console.log('response',response[0]);
        });

        $A.enqueueAction(action);
    }
})