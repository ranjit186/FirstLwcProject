trigger ContactTrigger on Contact (after Insert, after Update, after delete, after undelete) {
    
    switch on trigger.operationType {
        when  AFTER_INSERT{
            ContactTrigger.afteInsertHandler(Trigger.new);
            copyAddressFormAcc.copyContactAddFromAcc(Trigger.new);
        }
        
        when AFTER_UPDATE{
            updateContactAdd.updateContactMailineAddress(Trigger.new);
            ContactTrigger.afterUpdateHandler(Trigger.new, Trigger.oldMap);
        }
        when AFTER_DELETE{
            ContactTrigger.afterDeleteHandler(Trigger.old);
        }
        when AFTER_UNDELETE{
            ContactTrigger.afterUndeletehandler(Trigger.new);
        }
    }
    
}