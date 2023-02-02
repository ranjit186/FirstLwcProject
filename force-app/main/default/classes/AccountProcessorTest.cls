@isTest
public class AccountProcessorTest {
   @isTest
    public static void countContactsTest(){
        
        
        List<Account> accounts = new List<Account>();
        for(integer i=0; i<10; i++){
            Account acc = new Account();
            acc.Name = 'testAccountNAme '+ i;
            
            accounts.add(acc);
        }
        
        insert accounts;
        
        List<Contact> contList = new List<Contact>();
        List<Id>AccountIds = new List<Id>();
        for(Account each:accounts){
            for(Integer j=1; j<4; j++){
               Contact con = new Contact(); 
               con.LastName = 'cont ' + each.Name +' '+ j;
                
               contList.add(con);
            }
            AccountIds.add(each.id);
        }
        
        insert contList;
        
        Test.startTest();
        
        AccountProcessor.countContacts(AccountIds);
        
 		Test.stopTest();        
        
    }

}