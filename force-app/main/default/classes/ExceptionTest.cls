public class ExceptionTest {
    public static void exceptionsThrows(){
        try{
            // math exception
     		//Double  result  =  10/0;
        	//system.debug(result);
        
             //DML Exceptions
       		// Account  accRec = new Account();
       		// insert accRec;
       		
            String str;
        	system.debug(str.toLowerCase());
        } catch(Exception e){
            system.debug('Casuse: ' + e.getCause());
            system.debug('message: '+ e.getMessage());
            system.debug('Line Number: '+ e.getLineNumber());
            system.debug('Stack Trace: '+ e.getStackTraceString());
        }finally{
            system.debug('finally called');
        }
        
    }
    
}