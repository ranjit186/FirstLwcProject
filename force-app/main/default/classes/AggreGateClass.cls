public class AggreGateClass {
    Public static void getAagregateMethod(){
        AggregateResult[] groupedResult = [select StageName, MAX(Amount) MaxAmount, MIN(Amount) MinAmount, AVG(Amount) AvgAmount, SUM(Amount) SumAmount FROM Opportunity GROUP BY StageName];
        
        for(AggregateResult result : groupedResult){
            system.debug('stage Name: ' + result.get('StageName') + 
                         ' Maximum Amount: '+result.get('MaxAmount') + 
                         'Minimum amount: '+ result.get('MinAmount') + 
                         'Average amount: '+ result.get('AvgAmount') +
                         'Sum amount: '+ result.get('SumAmount')
                        );
        }
    }
      public static map<String, Integer> getHealthStatusCount(){
        Map<String, Integer> HealthCountStatus = new Map<String, Integer>();
        for (AggregateResult aggResult : [SELECT Health_Status__c, COUNT(Id) countMember FROM Person__c GROUP BY Health_Status__c]) {
            HealthCountStatus.put((string)aggResult.get('Health_Status__c'), (Integer)aggResult.get('countMember'));
        }
            System.debug(HealthCountStatus);
        return HealthCountStatus;
    }
}