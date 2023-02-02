public class ObjectPicklistApex {
    public static Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    @AuraEnabled Public static List<SObject> getAllObject(){
        List<SObject> getList = [SELECT SObjectType FROM ObjectPermissions GROUP BY SObjectType ORDER BY SObjectType ASC];
        
        return getList;
    }
    
    @AuraEnabled public static Map<String, String> getAllField(String objectName){
        system.debug('objectName : '+objectName);
        
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map <String, Schema.SObjectField> fieldMap = schemaMap.get(objectName).getDescribe().fields.getMap();
        
        system.debug('fieldMap : '+fieldMap.values());
        
        List<String> getallFieldName = new List<string>();
        
        Map<String, String> fieldDetail = new Map<String, String>();
        
        for(Schema.SObjectField each: fieldMap.values()){
            schema.describefieldresult dfield = each.getDescribe();
            
            getallFieldName.add(dfield.getname());
            fieldDetail.put(dfield.getname(), String.valueOf(dfield.getType()));
            //getallFieldName.add(dfield.getType ());
        }
        system.debug('fieldDetail : '+fieldDetail);
        system.debug('getallFieldName : '+getallFieldName);
        return fieldDetail;
    }
    
    @AUraEnabled 
    public static List<String> getFieldValue(String fieldName, String selectedObject){
        
        String querySet = 'SELECT ' + fieldName + ' FROM ' + selectedObject;
        
        List<SObject> getValue = Database.query(querySet);
        
        system.debug('getValue : '+getValue);
        List<String> fieldvalues = new List<String>();
        for(SObject each : getValue){
            String fieldvalueData = (String)each.get(fieldName);
            fieldvalues.add(fieldvalueData);
        }
        system.debug('fieldvalues : '+fieldvalues);
        return fieldvalues;
    }
}