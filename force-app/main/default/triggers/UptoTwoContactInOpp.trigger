trigger UptoTwoContactInOpp on Opportunity (before update) {

    set<id> oppoertunityId =  new set<Id>();
    
    for(Opportunity each: trigger.old){
        oppoertunityId.add(each.id);
    }
    
    
    
  
}