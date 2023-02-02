global class SendEmaiBlankPhone implements Database.Batchable<SObject>, schedulable {
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, Email, Name, Phone, CreatedDate FROM Lead where CreatedDate = Last_N_Days: 18 AND Phone = null');
    }
    global void execute(Database.BatchableContext BC, List<Lead> SendEmail){
        for(Lead each : SendEmail){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddress = new String []{each.Email};
            	mail.setToAddresses(toAddress);
            mail.setSenderDisplayName(each.name +' SalesForce Support');
            mail.setSubject(each.name +'have no phone number');
            mail.setPlainTextBody(each.Name + ' has not filled phone Number that Id have ' +each.Id);
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        }
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('Email has Sent to  user that have no email');
    }
    
    global void execute(SchedulableContext SC){
        
    }
}