public class TwilioSendSMS {
    public static void sendSms(){            
        try{
              // for(Integer i = 0 ; i <= 1; i++){
            String phNumber ='+918851423848';        
            String accountSid = 'AC49b099cfd5557c28ad0d76215b4e5a4b';        
            String token = 'fd20bd028d8262308c672690bbab53fe';        
            String fromPhNumber = '+16204559944';           
            String smsBody = 'This is the body of the sms sent by my class';        
            HttpRequest req = new HttpRequest();        
            req.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/'+accountSid+'/Messages.json');        
            req.setMethod('POST');        
            String VERSION  = '3.2.0';        
            req.setHeader('X-Twilio-Client', 'salesforce-' + VERSION);        
            req.setHeader('User-Agent', 'twilio-salesforce/' + VERSION);       
            req.setHeader('Accept', 'application/json');        
            req.setHeader('Accept-Charset', 'utf-8');        
            req.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(accountSid+':' +token)));        
            req.setBody('To='+EncodingUtil.urlEncode(phNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromPhNumber,'UTF-8')+'&Body='+smsBody);        
            Http http = new Http();        
            HTTPResponse res = http.send(req);        
            System.debug(res.getBody());        
            if(res.getStatusCode()==201) 
                System.Debug('Message sending Successful');        
            else{            
                System.Debug('Message sending Unsuccessful');
            }   
        //}  
        }   
        catch(Exception e){
            System.Debug('Error Message : ' + e.getMessage() + ' at line : ' + e.getLineNumber());
        }
        
    } 
}