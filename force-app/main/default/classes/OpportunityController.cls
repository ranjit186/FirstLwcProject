public class OpportunityController {
    public static void updateProfile(List<Id> oppIds){
         List<Opportunity> opps = [select Id, Amount, Profile__c from Opportunity where Id IN: oppIds];
     
        for(Opportunity opp : opps ){ 
            system.debug(opp);
           if(opp.Amount == null){
                opp.Profile__c = 'Low';
            }
            else if(opp.Amount < 10000){
                opp.Profile__c =  'Low';
            }else if(opp.Amount > 50000){
                opp.Profile__c =  'High';
            }else{
                opp.Profile__c =  'Medium';
            }

           
        }
        update opps;
    }
}