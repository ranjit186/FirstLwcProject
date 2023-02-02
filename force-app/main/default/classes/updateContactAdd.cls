public class updateContactAdd {
    public static void updateContactMailineAddress(List<Contact> getContactTrigger){
        
        try{
             system.debug('this is called th method');
        
        Set<Id> AccountsId = new Set<id>();
        //String contactid = '';
        set<Id> contactid = new set<id>();
        //Map<Id, Id> 
        for(Contact each : getContactTrigger){
            if(each.Copy_Address_From_Account__c == true){
                AccountsId.add(each.AccountId);
                contactid.add(each.Id);
            }
        }
            List<Contact> updatecontWithAdd =  new List<Contact>();
        system.debug('AccountId: ' + AccountsId);
            system.debug('contact id: '+ contactid);
            if(AccountsId.size() > 0){
                List<Account> accGet = [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingGeocodeAccuracy FROM Account WHERE ID IN: AccountsId];
                system.debug('Account Data get :  '+ accGet);
                 for(Account eachData : accGet){
                     for(Id conId: contactid){
                        contact con = new contact();
                        con.Id = conId;
                        con.MailingStreet = eachData.BillingStreet;
                        con.MailingCity = eachData.BillingCity;
                        con.MailingState = eachData.BillingState;
                        con.MailingPostalCode = eachData.BillingPostalCode;
                        con.MailingCountry = eachData.BillingCountry;
                        con.MailingGeocodeAccuracy  = eachData.BillingGeocodeAccuracy;
                    
                   		 updatecontWithAdd.add(con); 
                     }
                    
                    // break;
                }
            }
                
               
            
            system.debug('updatedContact : '+updatecontWithAdd);
            if(updatecontWithAdd.size() > 0){
                update updatecontWithAdd;
            }
           
            
        }catch(Exception e){
            system.debug('Message: '+ e.getMessage() + 'at' + e.getLineNumber());
        }
       
        
        
        
        
          
        
        
        
    }
}