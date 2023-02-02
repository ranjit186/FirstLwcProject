@RestResource(urlmapping = '/testApi')
global class testApiCall {
	@HTTPGet
    global static List<Contact> callGetMethod(){
        system.debug('call get method');
        return [Select Name From Contact limit 50];
    }
    
    @HTTPPost
    
    global static string callPostMethod(string email, string pswd){
        system.debug('email : '+ email);
        system.debug('Passowrd : '+ pswd);
        
        return 'safal rha';
    }
}