public class YADuplicateQuestion {
     public static void main(){
        list<integer> listt=new list<integer>{2,3,2,2,4};
        map<integer,integer> amap=new map<integer,integer>();
        for(integer a:listt){
            if(amap.get(a)<>null){
                amap.put(a, amap.get(a)+1);}
            else{
                amap.put(a,1);
            }
        } 
        system.debug(amap);
    }
    
    
}