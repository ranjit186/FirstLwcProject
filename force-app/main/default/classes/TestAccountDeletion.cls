@isTest
private class TestAccountDeletion {
    @isTest static void testDeleteAccountWithOneOpportunity(){
        
        Account acct = new Account(Name = 'Test Account');
        insert Acct;
        Opportunity opp = new Opportunity(Name = acct.Name + 'opportunity', 
                                         StageName = 'Prospecting',
                                          Closedate = System.today().addMonths(1),
                                          AccountId = acct.Id
                                        );
        insert opp;
         Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        Test.startTest();
        system.debug('start test class of deletion account');
         Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             result.getErrors()[0].getMessage());
    }
}