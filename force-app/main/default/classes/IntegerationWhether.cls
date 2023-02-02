public class IntegerationWhether {
    public static void getWhether(string cityName){
        try{
            string baseURL =  'http://api.weatherstack.com/';
            string Accesskey = '97deaca43979bfa6fdb3898fe0a389a6';
            Http http = new Http();
            HttpRequest request =  new HttpRequest();
            HttpResponse response = new HttpResponse();
            
            request.setMethod('GET');
            request.setEndpoint(baseURL+'current?access_key='+Accesskey+'&query='+cityName);
            response = http.send(request);
            system.debug('response:'+response.getBody());
            system.debug('Status'+response.getStatus());
            
            if(response.getStatus() == 'OK'){
                map<String, object> responseResult = new map<String, object>();
                map<String, object> responseResult2 = new map<String, object>();
                responseResult = (map<String, object>) JSON.deserializeUntyped(response.getBody());
                responseResult2 = (map<String, object>) responseResult.get('current');
                system.debug('responseResult:----->'+responseResult);
                system.debug('responseResult2::'+ responseResult2.get('temperature'));
            }
            
        }
        catch(Exception e){
            system.debug('message'+ e.getMessage() + 'at'+ e.getLineNumber());
        }
        
    }
}