public class SearchJiraData {
    
    
    public static Map<String, Object> serchIssue(String issueKey){
        Map<String, Object> responseMap = new Map<String, Object>();
        try{
            JIraurl__c obj = JIraurl__c.getOrgDefaults();
            system.debug('obj : '+ obj);
            String userEmail = obj.JiraUserEmail__c;
            String password = obj.JiraToken__c;   //using token
            string endPoint = obj.JiraIssue__c + '/'+issueKey;
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
            SearchJiraIssueWrapperClass IssueData = (SearchJiraIssueWrapperClass)JSON.deserialize(resp,SearchJiraIssueWrapperClass.class);
            
            responseMap.put('success', true);
            responseMap.put('message', IssueData);
            
        }catch(Exception e){
            system.debug('message : '+ e.getMessage() +  ' line : '+ e.getLineNumber() + '  cause : '+ e.getCause());
            // throw new AuraHandledException(e.getMessage());
            responseMap.put('success', false);
            responseMap.put('message', e.getMessage());
        }     
        return responseMap;
    }
    
    
    public static map<string, object> searchProject(string projectKey){
        Map<String, Object> responseMap = new Map<String, Object>();
        try{
            JIraurl__c obj = JIraurl__c.getOrgDefaults();
            system.debug('obj : '+ obj);
            String userEmail = obj.JiraUserEmail__c;
            String password = obj.JiraToken__c;   //using token
            string endPoint = obj.JiraProject__c + '/'+projectKey;
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
            
            SearchJiraProjectWrapperClass ProjectData = (SearchJiraProjectWrapperClass)JSON.deserialize(resp,SearchJiraProjectWrapperClass.class);
            
            responseMap.put('success', true);
            responseMap.put('message', ProjectData);
        }catch(Exception e){
            system.debug('message : '+ e.getMessage() +  ' line : '+ e.getLineNumber() + '  cause : '+ e.getCause());
            // throw new AuraHandledException(e.getMessage());
            responseMap.put('success', false);
            responseMap.put('message', e.getMessage());
        }     
        return responseMap;
    }
    public static Map<String, Object> serchParticularComment(String CommentId){
        Map<String, Object> responseMap = new Map<String, Object>();
        try{
            JIraurl__c obj = JIraurl__c.getOrgDefaults();
            system.debug('obj : '+ obj);
            String userEmail = obj.JiraUserEmail__c;
            String password = obj.JiraToken__c;   //using token
            string endPoint = obj.JiraParticularComment__c + '/'+CommentId;
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
            JiraParticularCommentWrapperClass CommentData = (JiraParticularCommentWrapperClass)JSON.deserialize(resp,JiraParticularCommentWrapperClass.class);
            
            responseMap.put('success', true);
            responseMap.put('message', CommentData);
            
        }catch(Exception e){
            system.debug('message : '+ e.getMessage() +  ' line : '+ e.getLineNumber() + '  cause : '+ e.getCause());
            // throw new AuraHandledException(e.getMessage());
            responseMap.put('success', false);
            responseMap.put('message', e.getMessage());
        }     
        return responseMap;
    }
    public static Map<String, Object> serchParticularUser(String AccountId){
        Map<String, Object> responseMap = new Map<String, Object>();
        try{
            JIraurl__c obj = JIraurl__c.getOrgDefaults();
            system.debug('obj : '+ obj);
            String userEmail = obj.JiraUserEmail__c;
            String password = obj.JiraToken__c;   //using token
            string endPoint = obj.JiraUser__c + '?' +'aacountId=' +AccountId;
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
            JiraParticularUserWrapperClass UserData = (JiraParticularUserWrapperClass)JSON.deserialize(resp,JiraParticularUserWrapperClass.class);
            
            responseMap.put('success', true);
            responseMap.put('message', UserData);
            
        }catch(Exception e){
            system.debug('message : '+ e.getMessage() +  ' line : '+ e.getLineNumber() + '  cause : '+ e.getCause());
            // throw new AuraHandledException(e.getMessage());
            responseMap.put('success', false);
            responseMap.put('message', e.getMessage());
        }     
        return responseMap;
    } 
    
    
    
}