public class QuestionsScript {
    public static void createAccount(){
        try{
            List<Account> accList = new List<Account>();
            
            for(integer i = 1; i<=20; i++){
                Account acc = new Account();
                acc.Name = 'Ranjit'+i;
                acc.Phone = '12345678' + i;
                acc.Fax = '123456789654'+i;
                
                accList.add(acc);
            }
            insert accList;
        }
        catch(Exception e){
            system.debug('message: ' + e.getMessage() + 'at' + e.getLineNumber());
        }
        
    }
    public static void createContWithAcc(){
        try{
            List<Account> ListAcc = new List<Account>();
            for(integer i = 100; i <=109; i++){
                Account acc = new Account();
                acc.Name = 'contactAccountLookup'+ i;
                ListAcc.add(acc);
            }
            
            insert ListAcc;
            
            List<Contact> listCont = new List<Contact>();
            for(Account each : ListAcc){
                Contact con = new Contact();
                con.LastName = 'accountChildLookUp' + each.Name;
                con.AccountId = each.Id;
                con.Email = 'kr.ranjit143@gmail.com';
                
                listCont.add(con);
            }
            
            insert listCont;
            system.debug('contact--->'+ listCont);
        }catch( Exception e){
            system.debug('message: '+ e.getMessage() + 'at' + e.getLineNumber());
        }
    }
    
    public static void createOpporTunity(){
        try{
            List<Opportunity> OppList = new List<Opportunity>();
            
            for(integer i = 10; i <  30; i++){
                Opportunity opp = new Opportunity();
                
                opp.StageName = 'Qualification';
                opp.Name = 'randomOpp' + i;
                opp.CloseDate = system.today();
                //Date myDate = date.newinstance(1960, 2, 17);
                
                OppList.add(opp);
            }
            
            // insert OppList;
            system.debug('insertData: '+ OppList);
        }catch(Exception e){
            system.debug('message: ' + e.getMessage() + 'at' + e.getLineNumber());
        }
    }
    
    public static void contractGetData(){
        try{
            List<Contract> contractList =
                [SELECT Id, AccountId, CustomerSignedId, StartDate, ContractTerm, Status, Account.Name
                 FROM Contract where AccountId != NULL AND CustomerSignedId != NULL];
            
            Set<Id> customerSignedById = new Set<Id>();
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
        catch(Exception e){
            system.debug('Message: '+e.getMessage() + 'at' + e.getLineNumber());
        }
        
    }
    public static void getCampaignList(){
        List<CampaignMember> ListCampaign = [Select CampaignId,Campaign.Name, Campaign.Status, Campaign.StartDate, LeadId from CampaignMember where Campaign.IsActive = true];
        system.debug(ListCampaign);
        for(CampaignMember campaignLoop:ListCampaign ){
            system.debug(campaignLoop.Campaign.Name + ',' + campaignLoop.Campaign.Status + ',' + campaignLoop.Campaign.StartDate);
            
        }
    }
}