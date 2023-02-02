({
    

    startGame : function(cmp, event){
        // acces comobobox via aura id 
        let gameModeComoBoX = cmp.find("gameMode");


        // access value of comobox  and store in a variable
        let setSlectedMode = gameModeComoBoX.get("v.value");
        
        const selectedMode = cmp.get("v.selectedMode");

        // update the value to another attribute variable (by use value provider v);
        cmp.set("v.selectedMode", setSlectedMode);
        if(selectedMode){
            const boardComp = cmp.find("boardComp");
            // call aura component
            boardComp.startGame();
        }
    },

    reShuffle : function(cmp, event){
        console.log("reshuffle boardComp : "+ cmp.find("boardComp"));
        const boardComp = cmp.find("boardComp");
        
        boardComp.reShuffleBoard();
        cmp.set("v.disableReshuffleBtn", true);
    },
    onResultHandler : function(Component, event, helper){
        const result = event.getParam("result");
        if(result === "win"){
            Component.set("v.disableReshuffleBtn", true);
            helper.addResultRecord(Component, result);
            helper.getResultReacord(Component);
        }else{
            Component.set("v.disableReshuffleBtn", false);
            helper.addResultRecord(Component, result);
            helper.getResultReacord(Component);
        }
    }
    ,
    myAction : function(cmp, event) {
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    }
})