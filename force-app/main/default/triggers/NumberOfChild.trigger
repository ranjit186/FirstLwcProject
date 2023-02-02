trigger NumberOfChild on Case ( After Insert,After Update,After Delete) {
    
    Set<Id> setAccIds = new Set<Id>();
    
    if(Trigger.isInsert){
        
        if(trigger.isAfter){
            for(Case con : Trigger.new){
                if(con.AccountId != null){
                    setAccIds.add(con.AccountId);
                }
            }
        }
        
    } 
    system.debug('setAccIds ==> '+setAccIds);
    
    if(Trigger.isUpdate){
        if(trigger.isAfter){
            for(Case con : Trigger.new){ 
                if(con.AccountId!=Trigger.oldMap.get(con.Id).AccountId){
                    setAccIds.add(con.AccountId);
                    setAccIds.add(Trigger.oldMap.get(con.Id).AccountId);
                }
            }        
        }
    }
    
    if(Trigger.isDelete){
        if(trigger.isAfter){
            for(Case con : Trigger.old) { 
                if(con.AccountId != null){
                    setAccIds.add(con.AccountId);
                }
            }
        }
    }

    if(setAccIds.size() > 0){
        database.executeBatch(new CaseBatch(setAccIds));
        system.debug('CaseBatch.setCaseAccountIds(setAccIds); '+ setAccIds);
    }
}