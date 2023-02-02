@isTest 
 public class testScriptQuestion {
	@isTest 
     public static void insertAccount(){
        
             
                Account Acc = new Account();
                Acc.Name = 'Ranjit';
                Acc.Phone = '12345678' ;
                Acc.Fax = '123456789654';
                 
   
             
         insert Acc;
         
         Test.startTest();
         
         Database.SaveResult result = Database.insert(Acc, false);
         System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
     }
 }