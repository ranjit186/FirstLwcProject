public class DynamicInsertField {
    public void insrtDataDynamic(){
        try{
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            String nameSpacePrefix =''; // if the metadata belongs to any package than include the namespace.                
            //First Record 
            Metadata.CustomMetadata firstMetadataRec =  new Metadata.CustomMetadata();
            firstMetadataRec.fullName = nameSpacePrefix + 'Issue.test1';
            firstMetadataRec.label = 'test123';           
            //adding values to fields
            Metadata.CustomMetadataValue customField1 = new Metadata.CustomMetadataValue();
            customField1.field = 'Jira_Field_Name__c';
            customField1.value = 'jiratest';
            firstMetadataRec.values.add(customField1);            
            Metadata.CustomMetadataValue customField2 = new Metadata.CustomMetadataValue();
            customField2.field = 'SF_Field_API__c';
            customField2.value = 'testdsd';
            firstMetadataRec.values.add(customField2);                       
            
            mdContainer.addMetadata(firstMetadataRec);  //adding record container that will be used to deploy the records in custom metadata.                        
            
            system.debug('mdContainer**'+mdContainer);            
            // Enqueue custom metadata deployment
            // jobId is the deployment ID
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
            system.debug('jobId***'+jobId);
        }
        catch(Exception ex){             
            //System.assert(false,ex.getMessage()); 
            system.debug('Error while creating modifying custom metadata.');
        }
    } 
    /**
*@desc: A method to bulk update the custom metadata records . 
**/
    
    public void updateBulkMetadata(){
        try{
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            for(Issue__mdt objMetadata :[SELECT Id, DeveloperName,
                                         MasterLabel, Label, Jira_Field_Name__c,
                                         SF_Field_API__c
                                         FROM Issue__mdt]){
                                             Metadata.CustomMetadata metadataRec =  new Metadata.CustomMetadata();
                                             metadataRec.fullName = 'Issue__mdt.'+objMetadata.DeveloperName;
                                             metadataRec.label = objMetadata.MasterLabel;
                                             Metadata.CustomMetadataValue customFieldtoUpdate = new Metadata.CustomMetadataValue();
                                             customFieldtoUpdate.field = 'Jira_Field_Name__c';
                                             customFieldtoUpdate.value = 'Issue.Key';
                                             metadataRec.values.add(customFieldtoUpdate);
                                             mdContainer.addMetadata(metadataRec);
                                         }
            system.debug('mdContainer**'+mdContainer);            
            // Enqueue custom metadata deployment
            // jobId is the deployment ID
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
            system.debug('jobId***'+jobId);                                   
        }catch(exception ex){
            system.debug('exception '+ex.getMessage());                                 
        }       
    } 
    
    
    public static void getAllIssueFields(){
        JIraurl__c obj = JIraurl__c.getOrgDefaults();
        system.debug('obj : '+ obj);
        String userEmail = obj.JiraUserEmail__c;
        String password = obj.JiraToken__c;   //using token
        // string endPoint = obj.JiraUser__c + '?' +'aacountId=' +AccountId;
        string endPoint = 'https://newjirasite.atlassian.net/rest/api/3/field/search';
        system.debug('endPoint : '+ endPoint);
        
        Http http =new Http();
        HttpRequest req =new HttpRequest();
        req.setEndpoint(endPoint);
        req.setmethod('GET');
        
        Blob headerValue = Blob.valueOf(userEmail+':'+password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        system.debug('authorizationHeader'+authorizationHeader);
        
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('cache-control','no-cache');
        req.setHeader('Content-Type','application/json');
        
        HttpResponse res = http.send(req);
        System.debug('res :'+res);
        System.debug('result of new :'+res.getBody());
        String resp = res.getBody();
        FieldJsonWrapperClass FieldList = (FieldJsonWrapperClass)JSON.deserialize(resp,FieldJsonWrapperClass.class);  
        
        system.debug('FieldList :'+FieldList.values);
        
        
        
        
        
        
        try{
          
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            List<Issue__mdt> issueMdt = new List<Issue__mdt>();
           issueMdt = [SELECT Id, DeveloperName, MasterLabel, Label, Jira_Field_Name__c, SF_Field_API__c FROM Issue__mdt];
            system.debug('issueMdt : '+ issueMdt);
            for(Issue__mdt objMetadata : issueMdt){
                                             for(FieldjsonWrapperClass.values eachvalue : FieldList.values){
                                                 system.debug('FieldList :'+eachvalue.id);
                                                 system.debug('SF_Field_API__c : '+ objMetadata.SF_Field_API__c);
                                                 if(objMetadata.SF_Field_API__c.containsIgnoreCase(eachvalue.id)){
                                                     system.debug('inside condition');
                                                     Metadata.CustomMetadata metadataRec =  new Metadata.CustomMetadata();
                                                     metadataRec.fullName = 'Issue__mdt.'+objMetadata.DeveloperName;
                                                     metadataRec.label = objMetadata.MasterLabel;
                                                     Metadata.CustomMetadataValue customFieldtoUpdate = new Metadata.CustomMetadataValue();
                                                     customFieldtoUpdate.field = 'Jira_Field_Name__c';
                                                     customFieldtoUpdate.value = eachvalue.id;
                                                     metadataRec.values.add(customFieldtoUpdate);
                                                     mdContainer.addMetadata(metadataRec);
                                                     
                                                 }
                                                 
                                             }
                                             
                                             
                                             
                                         }
            system.debug('mdContainer**'+mdContainer);            
            // Enqueue custom metadata deployment
            // jobId is the deployment ID
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
            system.debug('jobId***'+jobId);                                   
        }catch(exception ex){
            system.debug('exception '+ex.getMessage());                                 
        }
        
    }
    
    public static void JSONContactsMethod (){
        try{
            List<Contact> conList = [SELECT ID, firstName, lastName, Phone FROM Contact Limit 5];
            if(!conList.isEmpty()){
                JSONGenerator jsonGen = JSON.createGenerator(true);
                jsonGen.writeStartObject();
                jsonGen.writeFieldName('ContactList');
               // jsonGen.writeStartArray();
                //for(Contact con : conList){
                    jsonGen.writeStartObject();
                    jsonGen.writeStringField('ID','con.Id');
                    jsonGen.writeStringField('FirstName','con.firstName');
                    jsonGen.writeStringField('LastName','con.lastName');
                    jsonGen.writeStringField('Phone','con.Phone');
                    jsonGen.writeEndObject();
               // }
               //jsonGen.writeEndArray();
                jsonGen.writeEndObject();
                String jsonData = jsonGen.getAsString();
                System.debug('Json Data - ' + jsonData);
            }
            
        }catch(Exception e){
            system.debug('message : '+ e.getMessage() + '  at line '+ e.getLineNumber());
        }
        
    }

   
}