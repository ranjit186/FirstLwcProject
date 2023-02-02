trigger MyTrigger on Lead (before insert,after Insert, before Update, after update) {
  
    
    switch on Trigger.operationType{
        when BEFORE_INSERT{
          /*  for(Lead  leadRecord : Trigger.new){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
                if(String.isBlank(leadRecord.Industry)){
                    leadRecord.addError('The industry field must be filled');
                }   
            }
            */
            leadTriggerHandle.beforeInsertHandler(Trigger.new);
        }
        when AFTER_INSERT{
         leadTriggerHandle.afterInsertHandler(Trigger.new);
        }
        when BEFORE_UPDATE{
            leadTriggerHandle.beforeUpdateHandler(Trigger.new, Trigger.oldMap);
               
            }
    }
    
}