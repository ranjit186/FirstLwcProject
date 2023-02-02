@isTest
private class TestVerifyDate {
    @isTest static void ChechkVerifyDate(){
        Date myDate = date.newinstance(2021, 11, 17);
        Date myDate2 = date.newinstance(2021, 11, 27);
        Date getDateresults = VerifyDate.CheckDates(myDate, myDate2);
        
        system.assertEquals(myDate2, getDateresults);
        Date setDate = date.newinstance(2021, 11, 17);
        Date setDate2 = date.newinstance(2021, 12, 27);
        Date getDates = VerifyDate.CheckDates(setDate, setDate2);
        
    }
    
    //@isTest static void checkingDateWithin30days(){
        
  	//    Date firsdate = Date.today();
  	//	Date secondDate = Date.today().addDays(-1);
        
   //     Boolean getDate1Increse = VerifyDate.DateWithin30Days(firsdate, secondDate);
   //     system.assertEquals(false, getDate1Increse);
   // }
}