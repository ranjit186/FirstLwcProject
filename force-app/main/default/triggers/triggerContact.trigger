trigger triggerContact on Contact (after insert, before insert) {
    
    
    Integer countContact;
	 switch on trigger.operationType {
        when  AFTER_INSERT{
            copyAddressFormAcc.copyContactAddFromAcc(Trigger.new);
                //CreateContactWIthAccName.contactNameWithAcc(trigger.new);
        }
         when BEFORE_INSERT{
            // 
       
         }
     }
}