({

    startGame : function(component, event, helper) {
        // access combox
        let gameModeComboBox = component.find("gameMode");

        // acces comboBox value
        let selectedGameMode = gameModeComboBox.get("v.value");

        // set value to attribute
        component.set("v.selectedMode", selectedGameMode);

        alert("the start button  clicked and th game mode is "+ selectedGameMode);
    },
    reShuffle :  function (component, event, helper) {
        console.log("clicked Re-Shuffle button.");
    },


    myAction : function(component, event, helper) {
 // This will contain the string of the "value" attribute of the selected option
 var selectedOptionValue = event.getParam("value");
 alert("Option selected with value: '" + selectedOptionValue + "'");
    }
})