public class CreateContactWIthAccName {
    public static void contactNameWithAcc(List<Contact> newRecords){
        AggregateResult[] getCount = [SELECT count(Id) total from contact];
        Integer countContact = (Integer)getCount[0].get('total') - newRecords.size();
        system.debug('newRecords : '+ newRecords.size());
        set<Id> contactId = new set<Id>();
        for(contact each : newRecords){
            if(each.AccountId != null){
                contactId.add(each.Id);
            }
        }
        
        if(contactId.size() > 0){
            List<Contact> getContact = [SELECT ID, Account.Name, Name  from contact where Id In :contactId];
            for(Contact item : getContact){
                ++countContact;
                item.LastName = item.Account.Name+'_' + item.Name + '_' + countContact;
                
            }
            Update getContact;
            system.debug('newRecords : '+getContact);
        }
        
    }
}