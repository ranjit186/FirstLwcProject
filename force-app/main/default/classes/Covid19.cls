public class Covid19 {
	 private Integer recoverInArea = 0;
     private static Integer recoverInCountry = 0;
    
    public Covid19( Integer recoverInArea){
        recoverInArea = recoverInArea;
        recoverInCountry += recoverInArea;
    }
    public Covid19(){
       // this(3);
    }
    public void treatPatient(){
        recoverInArea++;
        recoverInCountry++;
    }
    public Integer getTreated(){
           
        return recoverInArea;
    }
    public static void printedTreated(){
        System.debug('Recovered in country : ' + recoverInCountry);
    }
}