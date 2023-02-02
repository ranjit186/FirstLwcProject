trigger UndeleteNotification on Time__c (after Delete) {
    string ownid = '';
    set<id> TimeIds = new set<id>();
    
    for(Time__c each: trigger.old){
        ownid =each.OwnerId;
        TimeIds.add(each.id);
        
    }
    
    UndeletdNotifiactionHandler.undeletedNotification(TimeIds);
    
    
}