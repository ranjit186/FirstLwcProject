public class TestPriceBook {
    public static void pricebookCreate(){
        List<Pricebook2> pricebookList = new List<Pricebook2>();
          Pricebook2 newpricebook = new  Pricebook2();
        newpricebook.Name = 'testranjitPricebok';
        insert newpricebook;
        system.debug(newpricebook);
        
    }
}