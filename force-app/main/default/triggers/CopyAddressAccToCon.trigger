trigger CopyAddressAccToCon on Contact (after insert,  after update, before update) {
      system.debug('CopyAddressAccToCon trigger starterrrrrrrrrrrrrr');
    Switch On Trigger.operationType {
        when AFTER_INSERT{
            system.debug('CopyAddressAccToCon trigger start');
           /*
            List<Contact> contWithAdd =  new List<Contact>();
            for(Contact each : Trigger.new){
                system.debug('each Name: ' + each);
                if(each.Copy_Address_From_Account__c == true){
                    Account accGet = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode,
                                      BillingCountry, BillingGeocodeAccuracy FROM Account Where Id =: each.AccountId];
                    contact con = new contact();
                    con.Id = each.Id;
                    con.MailingStreet = accGet.BillingStreet;
                    con.MailingCity = accGet.BillingCity;
                    con.MailingState = accGet.BillingState;
                    con.MailingPostalCode = accGet.BillingPostalCode;
                    con.MailingCountry = accGet.BillingCountry;
                    con.MailingGeocodeAccuracy  = accGet.BillingGeocodeAccuracy;
                    
                    contWithAdd.add(con);
                }
            }
            
            Update contWithAdd;
            */
        }
        
        
        when AFTER_UPDATE{
            system.debug('start method after updates');
          updateContactAdd.updateContactMailineAddress(Trigger.new);
        }
    }
}