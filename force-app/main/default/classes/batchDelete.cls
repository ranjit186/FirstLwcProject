public class batchDelete implements Database.Batchable<SObject>, schedulable {
    public Database.QueryLocator start(Database.BatchableContext BC ){
        return Database.getQueryLocator([Select Id, Name From Contact WHERE AccountId = '0015g00000TbYqMAAV']);
    }
    public void execute (Database.BatchableContext BC, List<Contact> Scope){
        delete scope;
        Database.emptyRecycleBin([Select Id, Name From Contact WHERE AccountId = '0015g00000TbYqMAAV']);
    }
    public void finish(Database.BatchableContext BC){
        system.debug('Deleted all contact');
    }
    public void execute(SchedulableContext sc){
        
    }
}