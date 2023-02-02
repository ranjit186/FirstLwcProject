public class UpdateQuery {
    public static void updateAcc(){
        List<account> accId = [select name, phone, id from account where name = 'ranjitsfdc' ];

system.debug(accId);
    }
}