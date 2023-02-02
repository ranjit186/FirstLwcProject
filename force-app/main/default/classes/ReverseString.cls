public class ReverseString {
    public static void methodName(){
        String name = 'ranjit';
        string revName = '';
        System.debug('lenght--'+name.length());
        System.debug('lenght--0 '+name.substring(0));
        System.debug('lenght--6 '+name.substring(6));
        for(integer i = name.length(); i >= 0; --i){
            system.debug('name.substring(i) : '+name.substring(i));
            
            if(name.substring(i).length() > 1){
                 system.debug('name.substring(i).substring(0,1) : '+name.substring(i).substring(0,1));
                 revName = revName + name.substring(i).substring(0,1);
            }
            else{
                 revName = revName + name.substring(i);
            }
           system.debug('revName : '+revName);
        }
        system.debug('revName : '+revName);
    }
}