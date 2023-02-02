public class WrapperTest {
    
    public static List<wrapperClass> wraplist = new List<wrapperClass>();
    
    @AuraEnabled
    public static List<wrapperClass> callWrapper(){
        
        List<wrapperClass> lst = new List<wrapperClass>();
         
        List<Account> accList = [select Id,Name,billingcity,phone from account LIMIT 40];
        List<Contact> conList = [select Id, AccountId,Name from Contact Where AccountId IN :accList];
        List<Opportunity> oppList = [select Id, AccountId,Name from Opportunity Where AccountId IN :accList];
        
        for(Account eachAcc: accList){
             wrapperClass wraObj = new wrapperClass();
            wraObj.AccName = eachAcc;
             wraplist.add(wraObj);
            for(Contact eachCont: conList){
                if(eachAcc.Id == eachCont.AccountId){
                    wraObj.conName = eachCont;
                }
            }
            
           for(Opportunity eachOpp: oppList){
                if(eachAcc.Id == eachOpp.AccountId){
       		     wraObj.OpportunityList = eachOpp;
                }
            } 
            
        }
                
        
        system.debug('lst size : '+ wraplist.size());
        system.debug('lst : '+ wraplist);
        for(wrapperClass eachObj : wraplist){
            system.debug('eachObj : '+ eachObj);
        }
        
        return wraplist;
    } 
   
        public class wrapperClass{
         @AuraEnabled   public Account AccName;
         @AuraEnabled   public contact conName;
         @AuraEnabled public Opportunity OpportunityList = new Opportunity();
            /*public wrapperClass(Account X1, contact y1){
                system.debug('X1 : ' + X1+ ' x2 : '+ y1);
                if(X1.Name != ''){
                    AccName = x1.Name ;
                    conName = y1.Name ; 
                }
                
            }*/
           // public wrapperClass(Opportunity Opp){
             //   OpportunityList.add(Opp);
            //}
            
         
        }
        
        /*
public static list<wrapaccount> wrapaccountList { get; set; }
public List<Account> accList {get; set;}
public List<Contact> conList {get; set;}

public WrapperTest (){

//if(wrapaccountList ==null){
wrapaccountList = new list<wrapaccount>();

accList = [select id,name,billingcity,phone from account];
conList = [select AccountId,name from Contact Where AccountId IN :accList];
// for(account a:){
//  wrapaccountlist.add(new wrapaccount(a));
// }
// for(contact c:[select id,name from Contact limit 10]){
//  wrapaccountlist.add(new wrapaccount(c));
//  }
for(Account eachAcc: accList){
for(Contact eachCont: conList){
if(eachAcc.Id == eachCont.AccountId){
wrapaccountlist.add(new wrapaccount(eachAcc, eachCont));
}
}
}
// }
}

//### SELECTED ACCOUNT SHOWN BY THIS METHOD
public static List<wrapaccount> ProcessSelected(){




system.debug('wrapaccountList : '+ wrapaccountList);
//  system.debug('selectedAccounts : '+ selectedAccounts);

for( wrapaccount each : wrapaccountList){
system.debug('each : '+ each.accRec.Name);
system.debug('each contact: '+ each.conRec.Name);
//for(SObject itemAcc : each.accRec){
//      system.debug('itemAcc : '+ itemAcc);
// }
// for(SObject itemCon : each.conRec){
//     system.debug('itemCon : '+ itemCon);

}

return wrapaccountList;
}

//##THIS IS WRAPPER CLASS
// account and checkbox taken in wrapper class

public class wrapaccount{

public Account accRec {get; set;}
public Contact conRec {get; set;}

public boolean isSelected{get;set;}
public wrapaccount(Account a, Contact c){
accRec = a;
conRec = c;
}

}

*/
    }