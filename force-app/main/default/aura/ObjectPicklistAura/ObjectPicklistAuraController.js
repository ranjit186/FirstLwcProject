({
    doInit : function(component, event, helper) {
        const action = component.get("c.getAllObject");
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            const state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.allObject", returnValue);
            }
        });
        $A.enqueueAction(action);
    },
    
    onChangeObject : function(component, event, helper){
        const selectedObject =  component.find("slectedObject").get("v.value");
        const allField = [];
        const allFieldType = [];
        const action = component.get("c.getAllField");
        action.setParams({objectName:selectedObject});
        action.setCallback(this, function(response){
            const returnValue  = response.getReturnValue();
            console.log("returnValue : "+returnValue);
            const state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.fieldAndType", returnValue);
                for(var key in returnValue){
                    
                    allField.push(key);
                    allFieldType.push(returnValue[key]);
                }
                 component.set("v.allObjectField", allField);
                component.set("v.slectedFieldType", allFieldType);
            }
        });
        $A.enqueueAction(action);
    },
    onChangeField : function(component, event, helper){
        const slectedField =  component.find("slectedField").get("v.value");
        const selectedObject =  component.find("slectedObject").get("v.value");
        
        const fieldsNdTypes = component.get("v.fieldAndType");
        component.set("v.slectedFieldType", fieldsNdTypes[slectedField]);
        
        const action = component.get("c.getFieldValue");
        action.setParams({fieldName : slectedField, selectedObject : selectedObject});
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            const State = response.getState();
            if(State == 'SUCCESS'){
                component.set("v.filedValue", returnValue);
            }
        });
        
        $A.enqueueAction(action);
        
    }
    
})