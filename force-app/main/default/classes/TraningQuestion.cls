public class TraningQuestion {
  @AuraEnabled
    public static void CreateNewAccount(String  AccName, String PhoneNo, String TypeOfAcc, String AccRating , String AccIndustry, string uName, string pswd){
        
        try{
              Account accList = new Account(Name = AccName, Phone = PhoneNo, Type = typeOfAcc, Rating = AccRating, Industry = AccIndustry, Useraname__c = uName, Password__c = pswd);
        
        /* for(Integer i= 0; i < NumberOfAccount ; i++){
            Account accObj = new Account();
            accObj.Name = Name + i;
            
            accList.add(accObj);
        } */
        insert accList;
            system.debug('accList : '+accList);
        } catch(Exception e){
            system.debug('Error : '+ e.getMessage() + ' at: '+e.getLineNumber());
        }
    }
    
    @AuraEnabled
    public static List<Opportunity> ShowOpportunity(){
   
            List<Opportunity> OpportunityList = [SELECT Name, Id FROM Opportunity LIMIT 100];
            
            return OpportunityList;
        
    }
    
     @AuraEnabled
    public static List<opportunity> updateToClosedate(String OpporId, String closeDate){
        system.debug('closeDate : '+closeDate);
        system.debug('OpporId : '+OpporId);
        List<Opportunity> ListOppo = [SELECT Id, CloseDate, Name, Description From Opportunity WHERE ID = :OpporId];
        for(Opportunity each : ListOppo){
            each.CloseDate = date.valueOf(closeDate);
            each.Description ='change close date'+closeDate;
        }
        update ListOppo;
        system.debug('ListOppo  :'+ ListOppo);
        return ListOppo;
    }
}