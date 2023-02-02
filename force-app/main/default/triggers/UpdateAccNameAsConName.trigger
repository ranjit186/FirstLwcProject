trigger UpdateAccNameAsConName on Contact (after insert, before delete) {
    switch on trigger.operationType {
        when AFTER_INSERT{
            //
            try{
                set<Id> AccIds = new set<Id>();
                  map<Id, string> AccIdGetTrigger = new map<Id, String>();
            for(contact eachCont : trigger.new){
                AccIdGetTrigger.put(eachCont.AccountId, eachCont.LastName);
                AccIds.add(eachCont.AccountId);
                
            }
            
            List<Account> getAllAccount = [Select Name, Id from Account where Id IN :AccIds];
              
            for(Account each : getAllAccount){
                system.debug('getData From Map: '+ AccIdGetTrigger.get(each.Id));
                each.Name =  each.Name +' '+ AccIdGetTrigger.get(each.Id);
            }
                update getAllAccount;
            }catch(Exception e){
                system.debug('Message'+ e.getMessage() + 'at' + e.getLineNumber());
            }
        }
        when BEFORE_DELETE{
            try{
                Map<Id, String> getAllData = new Map<Id, String>();
                set<Id> accIds = new set<Id>();
                for(Contact cont : trigger.old){
                    getAllData.put(cont.AccountId, cont.LastName);
                    accIds.add(cont.AccountId);
                }
                
                List<Account> AllAccData = [SELECT ID, Name From Account where Id IN : accIds];
                for(Account eachItem : AllAccData){
                    Integer contactNameIndex = eachItem.Name.indexOf(' '+getAllData.get(eachItem.Id));
                    eachItem.Name = eachItem.Name.substring(0, contactNameIndex);  
                }
                update AllAccData;
                system.debug('AllAccData:------>'+AllAccData);
            }catch(Exception e){
                system.debug('Message'+ e.getMessage() + 'at' + e.getLineNumber());
            }
        }
    }
}