public class ForLoops {
    public static void forLoopChallange(){
        for(Integer i = 0; i<=5; i++){
            string ptrn = '';
            for(Integer j = 0; j <=i ; j++){
                ptrn += '* '; 
            }
            System.debug(ptrn);
        }
    }
}