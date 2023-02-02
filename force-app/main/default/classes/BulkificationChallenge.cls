public class BulkificationChallenge {
    public static void updateBulkAccount(List<Id> accountIds){
        Map<Id, Integer> AccountToatalCaseMap = new Map<Id, Integer>();
        Map<Id, Integer> accountToatalCaseDaysMap = new Map<Id, Integer>();
      //  integer totalDays = 0, totalCase = 0;
        
        for(case caseObj: [Select Id, CreatedDate, ClosedDate, AccountId
                           from Case where IsClosed=true And  AccountId IN :accountIds]){
                               if( !AccountToatalCaseMap.containsKey(caseObj.AccountId)){
                                   AccountToatalCaseMap.put(caseObj.AccountId, 0);
                                   accountToatalCaseDaysMap.put(caseObj.AccountId, 0);
                               }
                                   Integer totalCase = AccountToatalCaseMap.get(caseObj.AccountId);
                                   totalCase++;
                                   AccountToatalCaseMap.put(caseObj.AccountId, totalCase);
                                   
                                   Integer totalDays =  accountToatalCaseDaysMap.get(caseObj.AccountId);
                                   totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date()); 
                                   accountToatalCaseDaysMap.put(caseObj.AccountId, totalDays);
                               }
        
        List<Account> AccountToUpdate = new List<Account>();
        for(Id accountId :AccountToatalCaseMap.keySet()){
            Decimal resolutionDays = accountToatalCaseDaysMap.get(accountId)/AccountToatalCaseMap.get(accountId);
            AccountToUpdate.add(new Account(id = accountId, Avg_case_Resoluation_Days__c = resolutionDays ));
              
        }

        update AccountToUpdate;
        system.debug(AccountToUpdate);
    }
}