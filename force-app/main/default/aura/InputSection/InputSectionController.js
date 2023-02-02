({
	 nameSelectFocusHandler : function(cmp, evt, helper){
        console.log("nameSelectFocusHandler : ");
        cmp.set("v.showNameSelectedDropDown", true);
    },
    nameSelectBlurHandler : function(cmp, evt, helper){
        cmp.set("v.showNameSelectedDropDown", false);
        
        console.log("nameSelectblurHandler");
    },
})