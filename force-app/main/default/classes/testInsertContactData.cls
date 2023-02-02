public class testInsertContactData {
    @AuraEnabled
    public static map<string, string> insertdata( string datas){
        map<string, string> response = new map<string, string>();
        try{
            contact cont = (contact)JSON.deserialize(datas, contact.class);
            system.debug('datas--'+datas);
          
        insert cont;
            response.put('status', 'success');
        }catch(Exception ex){
             response.put('status', 'error');
            response.put('message', ex.getMessage());
        }
        
        return response;
        
        
    }
    
    @AuraEnabled
    Public static List<Account> getAllAccount(){
        return [Select Id, Name From Account limit 200];
    }
}