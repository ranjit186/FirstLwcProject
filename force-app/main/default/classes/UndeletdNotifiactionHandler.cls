public class UndeletdNotifiactionHandler {
    @future
    public static void undeletedNotification(set<Id> TimeIds){
        List<Time__c> getAllData = [select Id,ownerId, Name, Start_Date__c, End_Date__c from Time__c where Id IN:TimeIds And End_Date__c >= LAST_MONTH And Start_Date__c >= LAST_MONTH And Name Like 'a%' AND isDeleted = true All ROWS];
        system.debug('getAllData: '+getAllData);
        
        user userEmail = [SELECT Id, Email FROM User where Id =: getAllData[0].ownerId];
        
        for(Time__c eachData: getAllData){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {userEmail.Email};
                mail.setToAddresses(toAddresses);
            mail.setSenderDisplayName('Salesforce Support');
            mail.setSubject('Alert Attempt to delete record');
            mail.setPlainTextBody('Attempt to delete your record '+ eachData.Name +' of the '+eachData.Id+'.');
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }
        system.debug('getAllData: '+ getAllData);
        undelete getAllData;
        
    }
}