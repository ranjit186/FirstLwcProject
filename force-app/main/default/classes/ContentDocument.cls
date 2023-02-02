public class ContentDocument {
    public static void createContentDocument(){
        //  Create Document Parent Record
        
        Account acc = new Account(Name='Test Account');
        Insert acc;
        // Create Document
        
        ContentVersion cv = new ContentVersion();
        
        cv.Title = 'Test Document';
        
        //cv.PathOnClient = 'TestDocument.pdf';
        cv.ContentUrl = 'https://newjirasite.atlassian.net/rest/api/2/attachment/content/10000';
        // cv.VersionData = Blob.valueOf('Test Content');
        
        cv.IsMajorVersion = true;
        
        Insert cv;
        
        system.debug('cv : '+ cv);
        
        //Get Content Documents
        
        Id conDocId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
        
        // Create ContentDocumentLink
        
        ContentDocumentLink cdl = New ContentDocumentLink();
        
        cdl.LinkedEntityId = acc.Id;
        
        cdl.ContentDocumentId = conDocId;
        
        cdl.shareType = 'V';
        
        Insert cdl;
        
    }
}