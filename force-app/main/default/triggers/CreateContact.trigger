trigger CreateContact on Account (after insert) {
    
    List<Contact> insertContact = new List<Contact>();
    
    for(Account each: trigger.new){
        system.debug(each.Id);
        system.debug(each.NumberOfEmployees);
        
        for(integer i = 1; i <= each.NumberOfEmployees; i++){
            Contact newContact = new Contact();
            newContact.LastName = each.Name + i + 'default';
            newContact.AccountId = each.Id;
            
            insertContact.add(newContact); 
        }
        
    }
    insert insertContact;
}