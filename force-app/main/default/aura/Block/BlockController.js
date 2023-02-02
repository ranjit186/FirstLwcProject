({
    blockClickHandler : function(component, event, helper) {
        const divElement = component.getElement(".wordsMainBlock");
        console.log("divElementdivElementdivElement :"+ divElement);
        const open = component.get("v.open");

        if(!open){
            component.set("v.open", true);

            // get label value
            let lableValue = component.get("v.label");
            // fire the block event
            let compEvent = component.getEvent("onclick");
            compEvent.setParams({value : lableValue});

            compEvent.fire();
        }
    },
 
    scriptsLoaded : function(component, event, helper){
        const divElement = component.getElement(".wordsMainBlock");

        console.log("divElement : "+ divElement);
        fitText(divElement);
    }
    
})