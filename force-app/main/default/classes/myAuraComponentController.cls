public with sharing class myAuraComponentController {
    
    @AuraEnabled
    public static List<Word_Shuffle__c> gameResultInsert(String result, String mode){
        try {
            
            Word_Shuffle__c gameResult = new Word_Shuffle__c(Mode__c = mode, Result__c = result);
            insert gameResult;

            System.debug('gameResult : '+gameResult);

            List<Word_Shuffle__c> ListWordsSuffle = [SELECT Id, Result__c, Mode__c, Name FROM Word_Shuffle__c];
            system.debug(ListWordsSuffle);
            return ListWordsSuffle;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public static List<Word_Shuffle__c> getGameResult(){
        List<Word_Shuffle__c> listWordShuffle = [SELECT Id, Result__c, Mode__c, Name FROM Word_Shuffle__c];

        return listWordShuffle;
    }
}