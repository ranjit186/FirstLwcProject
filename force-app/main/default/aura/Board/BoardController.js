({
    doInit : function(component, event, helper) {
        console.log("this is init render event");

        const gameMode = component.get("v.mode");

        console.log("gameMode  : "+ gameMode);
        let column = 0;
        if(gameMode && gameMode === "Hard"){
            column = 6;
        } else if(gameMode === "Medium"){
            column = 4;
        } else{
            column = 3;
        }

        const blockSize =  12 / column;

        component.set("v.blockSize", blockSize);
        const words = helper.getWords(column * column);
        component.set("v.words", words);
        // win words
        const getWinWord = helper.getWinWord(words)
        component.set("v.winWord", getWinWord);

        // reset the board

        helper.resetBoard(component);
    },
    doRender : function(component, event, helper) {
        // console.log("this is render function event");
    },
    blockClickHandler : function (component, event, helper){

        // console.log("called the blockClickHanller");

        const value = event.getParam("value");
        let clickCount = component.get("v.clickCount") + 1;
        if(value === component.get("v.winWord")){
            // you WIN
            component.set("v.result", "YOU WIN");
            helper.disableBoard(component);
            helper.fireResultEvent("win");
        }
        else if(clickCount === 3){
            // YOU LOSE
            component.set("v.result", "YOU LOSE");
            helper.disableBoard(component);
            helper.fireResultEvent("lose");
        }

        component.set("v.clickCount", clickCount);
    },

    reshuffleBoard : function(component, event, helper){
        const words = component.get("v.words");
        // console.log("words : "+words);
        const randomizeWords = helper.randomizeArray(words);

        component.set("v.words", randomizeWords);
        helper.resetBoard(component);
    }


})