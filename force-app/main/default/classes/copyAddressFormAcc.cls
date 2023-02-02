public class copyAddressFormAcc {
    public static void copyContactAddFromAcc(List<Contact> newReacords){
        
        List<Contact> congetList = new List<Contact>();
        Set<Id> contId =  new Set<Id>();
        set<Id> contAccountId = new Set<Id>();
        for(Contact each : newReacords){
            if(each.Copy_Address_From_Account__c == true){
                contAccountId.add(each.AccountId);
                contId.add(each.id);
            }
        }
        
        
        if(contAccountId.size() > 0){
            List<Account> accGet = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode,
                                    BillingCountry, BillingGeocodeAccuracy FROM Account Where Id IN :contAccountId];
            
            congetList.add([Select AccountId, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry From contact where id In:contId]);
            for(Contact eachitem : congetList){
                for(Account acc : accGet){
                    if(eachitem.AccountId == acc.Id){
                    system.debug('data of acc: ' + acc);
                    eachitem.MailingStreet = acc.BillingStreet;
                    eachitem.MailingCity = acc.BillingCity;
                    eachitem.MailingState = acc.BillingState;
                    eachitem.MailingPostalCode = acc.BillingPostalCode;
                    eachitem.MailingCountry = acc.BillingCountry;
                    }
                }
            }
        }  
        if(congetList.size() > 0){
            system.debug('contWithAdd:  '+congetList);
            update congetList;
        }
    }
}