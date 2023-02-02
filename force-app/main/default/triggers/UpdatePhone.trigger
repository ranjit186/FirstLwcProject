trigger UpdatePhone on Account (before update) {
    
    Set<String> accid = new set<String>();
    String PhoneNo ;
    for(Account each: trigger.old){
        accid.add(each.id);
        PhoneNo = each.Phone;
    }
    
    List<Contact> getAllContact = [SELECT Id, Name FROM contact  Where AccountId IN : accid];
    List<Contact> listContact = new List<Contact>();
    for(Contact data: getAllContact){
        contact con =  new contact();
        con.Id = data.Id;
        con.Phone = PhoneNo;
        
        listContact.add(con);
    }
   update listContact;
}