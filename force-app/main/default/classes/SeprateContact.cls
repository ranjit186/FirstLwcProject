public class SeprateContact {
    public static void OpenContact(){
        List <Contact> cont = new List<Contact>();
        List <Account> AccList = new List<Account>();
        for(Integer i=0; i<=4;i++){
            Account acc = new Account();
            acc.Name = 'Gopal'+ i;
            AccList.add(acc);
        }
        
        insert AccList;
        for( Account acc:AccList){            
            Contact con = new Contact();
            con.LastName = 'satyam'+acc.Name;
            con.AccountId = acc.id;
            cont.add(con);
        }
        insert cont;
    }
}