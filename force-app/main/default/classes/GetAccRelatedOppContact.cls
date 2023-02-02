public class GetAccRelatedOppContact {
  @AuraEnabled
    public static List<Account> getAllAccRealOppContact(){
        List<Account> AccList = [SELECT Name, Id, (SELECT Id, Name, StageName, AccountId FROM Opportunities), (SELECT Id, Name, AccountId, Phone FROM Contacts) FROM Account limit 10];
       
        system.debug('AccList : '+AccList);
        return AccList;
    }
}