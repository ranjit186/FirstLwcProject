public class ContractQueryTest {
    public static void contractGetData(){
        List<Contract>  contractList = 
            [SELECT Id, AccountId, CustomerSignedId, StartDate, ContractTerm, Status, Account.Name 
             FROM Contract where AccountId != NULL AND CustomerSignedId != NULL];
        
        Set<Id> customerSignedById = new  Set<Id>();
        for(Contract contrct : contractList){
            customerSignedById.add(contrct.CustomerSignedId);
        }
        List<Contact> contactList = [SELECT LastName, Id, AccountId FROM Contact Where Id IN :customerSignedById ];
        system.debug('contactList: '+ contactList);
        
        List<Contract> newContrctCreateList = new List<Contract>();
        for(Contract contactAccSame: contractList){
            for(Contact con : contactList) {
                if(con.AccountId == contactAccSame.AccountId){
                    system.debug('Contact AcountId: '+ contactAccSame.AccountId);
                    system.debug('contact AcountId: '+ con.AccountId);
                    Contract newCreateContact = new Contract();
                    newCreateContact.AccountId = contactAccSame.AccountId;
                    newCreateContact.Status = contactAccSame.Status;   
                    newCreateContact.StartDate = contactAccSame.StartDate;  
                    newCreateContact.ContractTerm = contactAccSame.ContractTerm; 
                    newCreateContact.CustomerSignedId = contactAccSame.CustomerSignedId; 
                    
                    newContrctCreateList.add(newCreateContact);
                }
            }   
        }
        insert newContrctCreateList;
        system.debug('new contact List: '+newContrctCreateList);
    }
}