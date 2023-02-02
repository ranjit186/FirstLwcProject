public class QueriesTest {
    public static void sObjectQueries(){
        List<SObject> conList = [select name, id, account.name from contact where  account.name != null];
        system.debug(conList);
        
        for(Sobject cont : conList){
            system.debug('Contact Name:  '+ cont.get('name'));
       		system.debug( ' id: ' + cont.get('id'));
            system.debug('Account Name: ' + cont.getSObject('Account').get('name'));
        }
    }
    public static void dmlChallenge(){
     account createAccout = new  Account(Name ='WingNut Films', Rating = 'Warm');
        system.debug(createAccout);
        database.insert(createAccout);
        system.debug(createAccout.Id);
        opportunity createOpportunity = new opportunity(AccountId = createAccout.Id, Name = 'Lord Of The Rings', stageName = ''); 
        createOpportunity.CloseDate = date.newInstance(2021, 10, 05);
        createOpportunity.StageName = 'Closed Won';
        system.debug(createOpportunity);
        database.insert(createOpportunity);
    }
}