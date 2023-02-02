({
    myAction : function(component, event, helper) {
        
    },
    
    SearchedSubject : function(cmp, evt, helper){
        
        const searchedItem = [];
        const keyWord = cmp.find("searchKeyword").get('v.value').toUpperCase();
        const getAllItem = cmp.get("V.subjectOptions");
        console.log(" keyWord : "+ keyWord);
        getAllItem.map((data) =>{
            if(data.value.toUpperCase().indexOf(keyWord) != -1){
            searchedItem.push(data);
        }
                       });
        cmp.set("v.searchedSubjectOptions", searchedItem);
    },
    searchFocusHandler : function(cmp, evt, helper){
        cmp.set("v.showDrownSubject", true);
    },
    
    
    selectSubject : function(cmp, evt, helper){
        const getValue = evt.target.dataset.value;
        console.log("getValue ", getValue);
        cmp.set('v.selectedValue', getValue);
        cmp.set("v.showDrownSubject", false);
    },
    
    searcBlurHandler : function(cmp, evt, helper){
        setTimeout(() => {
             cmp.set("v.showDrownSubject", false);
        }, 100);
    },
           
    
    searchNameFocusHandler : function(cmp, evt, helper){
        console.log("name focus");
    },
    nameHandleChange : function(cmp, evt, helper){
        console.log("called nameHandleChange");
    },
    searchRealtedName : function(cmp, evt, helper){
        console.log("searchRealtedName");
    },
    searchRealtedFocusHandler : function(cmp, evt, helper){
        console.log("searchRealtedHandler");
        cmp.set("v.showDropdownRealted", true);
        
    },
    searchRealtedBlurHandler : function(cmp, evt, helper){
        console.log("searchRealtedBlurHandler");
        cmp.set("v.showDropdownRealted", false);
    },
    nameSelectFocusHandler : function(cmp, evt, helper){
        console.log("nameSelectFocusHandler : ");
        cmp.set("v.showNameSelectedDropDown", true);
    },
    nameSelectBlurHandler : function(cmp, evt, helper){
        setTimeout(() =>{
           cmp.set("v.showNameSelectedDropDown",false ); 
        }, 150);
    },
	NameChangeHandler : function(cmp,evt, helper){
        console.log("clicked for get value");
        const getNameValue = evt.target.dataset.value; 
        console.log("getValue ", getNameValue.toLowerCase());
        cmp.set("v.selectedNameIcon", getNameValue.toLowerCase());
        console.log("getvalue of cmp : "+cmp.get("v.selectedNameIcon"));
    },    
    relatedToFocusHandler : function(cmp, evt, helper){
        cmp.set("v.showRelatedToDropDown", true);
        console.log("nameSelectblurHandler related");
    },
    
    relatedToBlurHandler : function(cmp, evt, helper){
        cmp.set("v.showRelatedToDropDown", false);
        console.log("nameSelectblurHandler related");
    },
    assignedToFocusHandler : function(cmp, evt, helper){
        cmp.set("v.showAssignedToDropDown", true);
    },
    assignedToBlurHandler : function(cmp, evt, helper){
        cmp.set("v.showAssignedToDropDown", false);
    }
    
    
})