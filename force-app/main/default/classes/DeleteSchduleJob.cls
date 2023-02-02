public class DeleteSchduleJob {
    public static void DeleteSchduleJobAccount(){
        CronJobDetail cronId = [SELECT Id FROM CronJobDetail WHERE Name = 'Deleted Account'];
        CronTrigger ct = [SELECT Id FROM CronTrigger where cronJobDetailId=: cronId.Id];
        system.debug('ct: '+ ct);
        system.abortJob(ct.Id);
    }
    
    //delete schedule job of  insert  opportunity 4 time in a day
      public static void deleteInsertoppScheduleJob(){
        CronJobDetail cronId = [SELECT Id FROM CronJobDetail WHERE Name = 'schedule every 6 hour Insert Daily 5 opportunity'];
        CronTrigger ct = [SELECT Id FROM CronTrigger where cronJobDetailId=: cronId.Id];
        system.debug('ct: '+ ct);
        system.abortJob(ct.Id);
    }
    
    // delete schedule run count countact update in evry 5 min
    
    public static void deleteCountUpdateInFiveMin(){
        for(Integer i = 0; i<=55; i += 5){
            string JobNames = 'counts contact Run in every 5 mins'+i;
            CronJobDetail cronId = [SELECT Id FROM CronJobDetail WHERE Name =:JobNames];
            CronTrigger ct = [SELECT Id FROM CronTrigger where cronJobDetailId=: cronId.Id];
        system.debug('ct: '+ ct);
        system.abortJob(ct.Id);
        }
    }
    
}