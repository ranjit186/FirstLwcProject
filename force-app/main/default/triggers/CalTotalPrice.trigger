trigger CalTotalPrice on Contact (after update) {
    
    try{
        set<Id> ContactAccountId = new Set<Id>();
        
        for(contact each: trigger.new){
            if(String.isNotBlank(each.AccountId)){
                ContactAccountId.add(each.AccountId);  
            }
            
        }
        
        AggregateResult[] getDatas = [SELECT  sum(Price__c) totalPrice, AccountId 
                                      FROM Contact where AccountId IN:ContactAccountId  group by AccountId ];
        
        
        List<Account> AccUpdate = new List<Account>();
        
        for(AggregateResult eachdata : getDatas){
            
            Account acc = new Account();
            
            system.debug('totalPrice: '+eachdata.get('totalPrice'));
            if(eachdata.get('totalPrice') != null){
                acc.id = (string)eachdata.get('AccountId');
                acc.Total_Price__c = (decimal)eachdata.get('totalPrice');
                if(MATH.mod(Integer.valueOf((decimal)eachdata.get('totalPrice')), 2) == 0){
                    acc.isEven__c = true;
                }
                
            }
            
            
            AccUpdate.add(acc);
        }
        update AccUpdate;
    }
    catch(DmlException e){
        system.debug('this is message: '+ e.getMessage());
    }
    
}