public class FetchOppoUse{
    
    
    public static void getData(String uName){
        
        List<User> userDetail = [SELECT Id, Username, Email FROM User WHERE Username = :uName];
        set<Id>UserID = new set<Id>();
            
            for(user each : userDetail){
            UserID.add(each.Id);
        }
        
        List<opportunity> getAllData = [SELECT Id, StageName, CreatedById FROM Opportunity Where CreatedById IN :UserID];
        
        system.debug('userDetail : '+ userDetail);
        system.debug('getAllData : '+getAllData);
    }
    

}