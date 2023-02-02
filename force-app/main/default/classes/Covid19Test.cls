@isTest
public class Covid19Test {
    
	@isTest
    public static void treatPatietTest(){
        Covid19 delhi = new Covid19(8);
        integer delhirec = delhi.getTreated();
        system.assertEquals(8,delhirec,  'these are not equals');
    }
    
}