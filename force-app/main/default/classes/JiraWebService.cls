@RestResource(urlMapping='/myurl') 
global without sharing class JiraWebService {
    @HttpPost
    global static void CreateRocord() 
    { 
        try
        {
            RestRequest request = RestContext.request; 
            Blob body = request.requestBody;
            
            String bodyString = body.toString();
            system.debug('bodyString====='+bodyString);
            
            JiraWrapperClass issueList = (JiraWrapperClass)JSON.deserialize(bodyString,JiraWrapperClass.class);       
            System.debug('issueList >>>'+issueList);
            System.debug('issueList.issue >>>'+issueList.issue.fields.summary); 
            System.debug(' issueList.issue.id >>>'+ issueList.issue.id);
            system.debug('webhookEvent : '+ issueList.webhookEvent);
            
            
            if(issueList.webhookEvent == 'user_created'){
                createJisraUser(issueList);
            }else if(issueList.webhookEvent == 'jira:issue_created'){
                List<Jira_User__c> jiraUser = new  List<Jira_User__c>();
                string jiraUserAccountId = issueList.user.accountId;
                jiraUser = [SELECT Id, Name From Jira_User__c where Name =: jiraUserAccountId limit 1];
                
                if(jiraUser.isEmpty()){
                    Jira_User__c createUser = createJisraUser(issueList);
                    jiraUser.add(createUser);
                }
                
                List<Jira_Project__c> jiraPrj = [SELECT Id, Name From Jira_Project__c where Name =: issueList.issue.fields.project.key limit 1];
                if(jiraPrj.isEmpty()){
                    Jira_Project__c jiraProject = CreateProject(issueList.issue.fields.project, jiraUser);
                    jiraPrj.add(jiraProject);
                }
                
                Jira_Issue__c newJiraIssue = new Jira_Issue__c();
                newJiraIssue.Jira_Project__c = jiraPrj[0].Id;
                newJiraIssue.Jira_User__c = jiraUser[0].Id;
                newJiraIssue.Name = issueList.issue.key;
                newJiraIssue.Key__c = issueList.issue.key;
                newJiraIssue.Summary__c = issueList.issue.fields.summary;
                newJiraIssue.Description__c = 'tgis is testing descrition';
                
                insert newJiraIssue;
            }
        }
        catch(Exception e){
            system.debug('ERROR>>>>'+e.getMessage()+'IN LINE>>>'+e.getLineNumber());
        }
    }
    
    public static Jira_User__c createJisraUser(JiraWrapperClass data){
        system.debug('call create user method');
        
        //object userdata = data.user; 
        
        string objUserDisplayName = data.user.displayName;
        
        Jira_User__c jiraUserObj =  new Jira_User__c();
        jiraUserObj.Name = objUserDisplayName;
        jiraUserObj.Username__c = objUserDisplayName;
        jiraUserObj.AccountId__c = data.user.accountId;
        insert jiraUserObj;
        
        system.debug('---jiraUserObj---'+ jiraUserObj);
        
        return jiraUserObj;
    }
    
    Public static Jira_Project__c CreateProject(jiraWrapperClass.project data, List<Jira_User__c> jiraUser ){
        
        Jira_Project__c newProject = new Jira_Project__c();
        newProject.Name = data.name;
        newProject.Key__c = data.key;
        newProject.Jira_User__c = jiraUser[0].Id;
        
        insert newProject;
        system.debug('-----newProject----'+ newProject);
        return newProject;
    }
}