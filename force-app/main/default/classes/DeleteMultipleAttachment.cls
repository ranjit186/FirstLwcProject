public class DeleteMultipleAttachment {
    public static void getAndDeleteMultipleAttchment(){
        List<Account> getAllAttchments = 
            [Select Name, (SELECT Id, Title  from  CombinedAttachments),  (Select Name From  Contacts) From Account];
        
        system.debug('all get Data: '+ getAllAttchments);
        // List<Contact> allContactdataDelete = new List<Contact>();
        // List<Contact> insertContactData = new List<Contact>();
        
        // List<CombinedAttachments> allAttchmentdelete = new List<CombinedAttachments>();
        // List<CombinedAttachments> insertAttchment = new List<CombinedAttachments>();
        
        Map<Id, List<SObject>> mapAttchmentData = new Map<Id, List<SObject>>();
        Map<Id, List<contact>> mapContactData = new Map<Id, List<contact>>(); 
        
        for(Account acclistData : getAllAttchments){
            if(acclistData.CombinedAttachments.size() > 2){
                for(SObject AttchmentPutToMap : acclistData.CombinedAttachments){
                    if(!mapAttchmentData.containsKey(acclistData.Id)){
                        mapAttchmentData.put(acclistData.Id, new List<SObject>());
                    }
                    mapAttchmentData.get(acclistData.Id).add(AttchmentPutToMap);
                }
            }
            
            
            if(acclistData.Contacts.size() > 2){
                for(Contact ContactPutToMap : acclistData.Contacts){
                    if(!mapContactData.containsKey(acclistData.Id)){
                        mapContactData.put(acclistData.Id, new List<SObject>());
                    }
                    mapContactData.get(acclistData.Id).add(ContactPutToMap);
                }
            }  
        }
       // delete mapAttchmentData;
       // delete mapContactData ;
        system.debug('map data: '+ mapAttchmentData);
        system.debug('map data: '+ mapContactData);
        
        
        
        
    }
}