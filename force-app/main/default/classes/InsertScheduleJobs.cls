public class InsertScheduleJobs {
    public static void InsertScheduleJobAcc(){
        string CRON_EXP = '0 0 12 * * ? *';
        
        TenDayBeforeAcc AccBatchInstance = new TenDayBeforeAcc();
        
        system.schedule('Deleted Account', CRON_EXP, AccBatchInstance);
    }
    
    //Insert schedule job of  insert  opportunity 4 time in a day
    public static void insertScheduleJobOpp(){
        string CRON_EXP = '0 0 0/6 * * ? *';
        
        CreateOppoDailyBatch OpportunityBatchInstance = new CreateOppoDailyBatch();
        
        system.schedule('schedule every 6 hour Insert Daily 5 opportunity', CRON_EXP, OpportunityBatchInstance);
    }
    
    // batch of count' contact run every 5 min
    
    public static void runContactCountBatchInFiveMins(){
        
        for(Integer i = 0; i<=55; i += 5 ){
            string CRON_EXP = '0 '+i+' * * * ? *'; 
            UpdateCountContact UpdateCountContactBatchInstances = new UpdateCountContact();
            
            system.schedule('counts contact Run in every 5 mins'+ i, CRON_EXP, UpdateCountContactBatchInstances);
        }        
        
    }
    
    // batch of fatchh lead that have blank phone field and sen email
    
    
    public static void scheduleEveryDayToFetchLead(){
        string CRON_EXP = '0 0 0 * * ? *';
        
        SendEmaiBlankPhone LeadFetchBatchInstance = new SendEmaiBlankPhone();
        
        system.schedule('schedule for fetch lead EveryDay at 00:00', CRON_EXP, LeadFetchBatchInstance);
    }
    public static void insertJobDeleteBatch(){
        string CRON_EXP = '0 0 23 1 * ? *';
        batchDelete BDel = new  batchDelete();
		system.schedule('delete contact',CRON_EXP, BDel );
        
        
    }
    
    public static void YaQuestionTest(){
        string CRON_EXP = '0 0 23 1 ? * ?';
        
          batchDelete BDel = new  batchDelete();
        
        system.schedule('Fire on First Of Every  Month At 11Pm ', CRON_EXP, BDel);
    }
    
}