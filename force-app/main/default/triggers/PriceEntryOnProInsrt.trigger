trigger PriceEntryOnProInsrt on Product2 (after insert) {
   Pricebook2 pricbookId =  [SELECT Id, Name FROM Pricebook2 where Pricebook2.isStandard = true LIMIT 1];
    List<PricebookEntry> listPriceBokEntry = new List<PricebookEntry>();
    for(Product2 each : Trigger.new){
        PricebookEntry newPriceBookEntry = new PricebookEntry();
        newPriceBookEntry.UnitPrice = 1;
        newPriceBookEntry.Pricebook2Id = pricbookId.Id;
        newPriceBookEntry.Product2Id = each.Id;
            
        listPriceBokEntry.add(newPriceBookEntry);
    }
    insert listPriceBokEntry;
}