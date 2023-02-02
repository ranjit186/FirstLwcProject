@isTest
public class DeleteUser {

    static testMethod void testMe(){
        test.startTest();
        Id profileid=Userinfo.getProfileId();
        Profile profilname = [SELECT Id, Name FROM Profile WHERE id=:profileid]; 
        Task taskObj = new Task();
        taskObj.Subject = 'Call';
         taskObj.Priority = 'Normal';
         taskObj.Status = 'In Progress';
        
        insert taskObj;
        
        	try
			{
                if(profilname.Name != 'System Administrator'){
            taskObj.addError('No Access for Deletion');                                    
        } 
				Delete 	taskObj;
			}
        catch(Exception e){
            
        }
		test.stopTest();	
    }
}