trigger SendContactEmail on Contact (after insert) {
    try{
        if(RecursiveTriggerHandler.isFirstTime == true){
            RecursiveTriggerHandler.isFirstTime = false;
           set<Id> ContactId = new set<Id>();
        
        for(Contact each: trigger.new){
            ContactId.add(each.id);
        }
        system.debug('ContactId: '+  ContactId );
        if(ContactId.size() > 0){
            
            for(Contact eachId : [select id, Name, Email, phone, MailingAddress from contact Where id IN :ContactId]){
                system.debug('id: '+ eachId.Id + ' Name: ' + eachId.Name + ' Email: '+ eachId.Email);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {eachId.Email};
                    mail.setToAddresses(toAddresses);
                mail.setSenderDisplayName('Salesforce Support');
                mail.setSubject('Alert ' + eachId.Name );
                mail.setPlainTextBody('A new contact is inserted in Salesforce and the '+ eachId.Name +' of the '+eachId.Id+', '+eachId.Phone+' and '+eachId.MailingAddress +'.');
                
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            } 
            
        } 
        }
        
        
    }
    catch(Exception e){
        system.debug('Message: ' + e.getMessage() + 'at' + e.getLineNumber());
    }
}