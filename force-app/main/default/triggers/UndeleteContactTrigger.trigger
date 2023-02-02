trigger UndeleteContactTrigger on Contact (after undelete) {
    
    List<Contact> undeletedContactList = new List<Contact>();
    
    for(Contact each  : trigger.new){
        
        
        contact undeleteContact = new Contact();
        undeleteContact.Id = each.id;
        undeleteContact.LastName = each.LastName + ' Undeleted Contact';
        undeleteContact.Email	= 'ranjit.yadav@cloudanalogy.com';
        undeletedContactList.add(undeleteContact);
        
    }
    
    update undeletedContactList;
    
    for(contact eachdata: undeletedContactList){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {eachdata.Email};
            mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('undelete Your contact : ' + eachdata.LastName);
        mail.setPlainTextBody('Your contact: ' + eachdata.Id +' has been undeleted.');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }  
}