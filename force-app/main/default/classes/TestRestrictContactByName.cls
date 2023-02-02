@isTest
private class TestRestrictContactByName {
    @isTest static void testinvalidname(){
        Contact con = new Contact(LastName = 'INVALIDNAME', Email = 'kr.ranjit143@gmail.com');	
		insert con;
        
        Test.startTest();
        system.debug('get data to insert: '+con);
       
        Database.SaveResult srList = Database.insert(con, false);
        Test.stopTest();
        System.assert(!srList.isSuccess());
        System.assert(srList.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             srList.getErrors()[0].getMessage());
    }
    	    
}