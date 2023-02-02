public class MaintenenceContacts {
    public static void getMaintenenceRating(){
        List<Contact> UpdateCont = new List<Contact>();
        for(contact getContactRating: [SELECT Id, Name, (SELECT Rating__c From maintenances__r) FROM contact]){
            Decimal average = 0;
            integer rate = 0;
            for(maintenance__c each : getContactRating.maintenances__r){
                rate += Integer.valueOf(each.Rating__c); 
            }   
            if(getContactRating.maintenances__r.size() >0){
                average = rate/getContactRating.maintenances__r.size(); 
            }  
            Contact cont = new Contact(Id = getContactRating.Id, Average_rating__c = average); 
            UpdateCont.add(cont);
        }
        update UpdateCont;
        system.debug('map collections: '+UpdateCont);
    }
}