@RestResource(urlMapping='/myurla')
global class webHookTestInt {
    @HttpPost
    global static string getDataOfWebhook(){
        
        system.debug('this is call webHook');
        
        
        
        RestRequest request = RestContext.request;
        Blob body = request.requestBody;
        
        //Blob body = request.requestBody;
        String bodyString = body.toString();
        system.debug('bodyString--->'+ bodyString);
        system.debug('bodyString issue--->'+ bodyString); 
        //Map<String, Object> n = (Map<String, Object>)JSON.serialize(bodyString);
        //System.debug('-------n------'+n);
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(bodyString);
        
        system.debug('webhookEvent : '+ m.get('webhookEvent'));
        
        Object eventtype = m.get('webhookEvent');
        
        string eventname = eventtype.toString();
        system.debug('----eventname---'+eventname);
        
        if(eventname == 'user_created'){
            createJisraUser(m);
        }else if(eventname == 'jira:issue_created'){
            Map<String,Object> objectlist = ( Map<String,Object> )m.get('issue');
            system.debug('objectlist--->'+ objectlist);
            Map<String,Object> objectlistFiled = ( Map<String,Object> )objectlist.get('fields');
            Map<String,Object> objectlistProject = ( Map<String,Object> )objectlistFiled.get('project');
            
            object ObjprojectKey = objectlistProject.get('key');
            string projectKey = ObjprojectKey.toString();
            
            
            system.debug('objectlist fields--->'+ objectlistFiled);
            system.debug('objectlistFiled summary--->'+ objectlistFiled.get('summary'));
            
            Map<String,Object> userData = ( Map<String,Object> )m.get('user');
            object objUserDisplayName = userData.get('displayName');
            string jiraUserDisplyName = objUserDisplayName.toString();
            
            List<Jira_User__c> jiraUser = new  List<Jira_User__c>();
            
            jiraUser = [SELECT Id, Name From Jira_User__c where Name =: jiraUserDisplyName limit 1];
            
            if(jiraUser.isEmpty()){
                Jira_User__c createUser = createJisraUser(m);
                jiraUser.add(createUser);
            }
            
            List<Jira_Project__c> jiraPrj = [SELECT Id, Name From Jira_Project__c where Name =: projectKey limit 1];
            if(jiraPrj.isEmpty()){
               Jira_Project__c jiraProject = CreateProject(objectlistProject, jiraUser);
                jiraPrj.add(jiraProject);
            }
            
            
            object objIssueKey = objectlist.get('key');
            string IssueKey = objIssueKey.toString();
            
            object objSummary = objectlistFiled.get('summary');
            String Summary = objSummary.toString();
            
            Jira_Issue__c newJiraIssue = new Jira_Issue__c();
            newJiraIssue.Jira_Project__c = jiraPrj[0].Id;
            newJiraIssue.Jira_User__c = jiraUser[0].Id;
            newJiraIssue.Name = IssueKey;
            newJiraIssue.Key__c = IssueKey;
            newJiraIssue.Summary__c = Summary;
            newJiraIssue.Description__c = 'tgis is testing descrition';
            
            insert newJiraIssue;
            
        }
        
        
      
        
        
        
        // Object FieldString = objectlist.get('fields');
        //object filedsData  = objectlist.get('fields');
        
        
        //   Map<String,Object> objectlistFiled = ( Map<String,Object> )filedsData;
        //string fData = filedsData.toString();
        
        

        /*Object email; 
Object Fname; 
Object Uname;
email = objectlist.get('emailAddress'); 
Fname = objectlist.get('displayName'); 
Uname = objectlist.get('name');

Jira_User__c create = new Jira_User__c();
create.Username__c = Uname.toString(); 
create.Name = Fname.toString(); 
create.Email_Address__c = email.toString();
insert create;
*/
        system.debug('-----------'+bodyString);
        
        
        
        return 'bodyString';
        
    }
    
    global static Jira_User__c createJisraUser(Map<String, Object> data){
        system.debug('call create user method');
        Map<String,Object> userData = ( Map<String,Object> )data.get('user');
        object objUserDisplayName = userData.get('displayName');
        
        
        Jira_User__c jiraUserObj =  new Jira_User__c();
        jiraUserObj.Name = objUserDisplayName.toString();
        
        insert jiraUserObj;
        
        system.debug('---jiraUserObj---'+ jiraUserObj);
        
        return jiraUserObj;
    }
    
    global static Jira_Project__c CreateProject(Map<String, Object> data, List<Jira_User__c> jiraUser ){
        object ObjProjectName = data.get('name');
		String projectName = ObjProjectName.toString();
         
        object ObjProjectKey = data.get('name');
		String projectKey = ObjProjectName.toString();
        
        Jira_Project__c newProject = new Jira_Project__c();
        newProject.Name = projectName;
        newProject.Key__c = projectKey;
        newProject.Jira_User__c = jiraUser[0].Id;
        
        insert newProject;
        system.debug('-----newProject----'+ newProject);
        return newProject;
    }
}