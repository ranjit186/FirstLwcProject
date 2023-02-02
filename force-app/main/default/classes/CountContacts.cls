public class CountContacts {
    public static void getCountContactAcc(){
        List<Account> accList =  [SELECT Id, Name, (SELECT Name from contacts), (SELECT Name FROM Opportunities) FROM Account];
        
        Map<Id, List<String>> contactData = new  Map<Id, List<String>>(); 
        for(Account acc : accList){
            
            for(Contact conts: acc.contacts){
                if(!contactData.containsKey(acc.Id)){
                    contactData.put(acc.Id, new List<String>());
                }
                contactData.get(acc.id).add((String)conts.Name);
            }
            
            
            
            for(opportunity opp :acc.Opportunities){
                if(contactData.get(acc.Id) != null){
                    if(contactData.get(acc.Id).contains(String.ValueOf(opp.Name))){
                        system.debug(acc.Name+' the number of contact have in account: ' + acc.contacts.size());
                    }
                }
            }
        }  
        
        system.debug('contactData: ' + contactData);
        
        
        
    }
}