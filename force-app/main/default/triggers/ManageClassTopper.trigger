trigger ManageClassTopper on Student__c (before insert, after update) {

    switch on trigger.operationType{
        when AFTER_UPDATE{
            set<Id> studentsId = new Set<Id>();
            for(Student__c each : trigger.new){
                studentsId.add(each.class__c);
                system.debug('class id: '+ each.class__c);
            }
            
            List<Student__c> studentData = [SELECT Class__c, Name, Class__r.Total_Marks__c,  Obtained_Marks__c, Id 
                                            FROM Student__c WHERE Class__c IN: studentsId];
            List<Class__c> updateClass = new List<Class__c>();
            for(Student__c eachData : studentData){
                Class__c classinsObj = new Class__c();
                classinsObj.id = eachData.Class__c;
                classinsObj.Total_Marks__c = eachData.Class__r.Total_Marks__c + eachData.Obtained_Marks__c;
                classinsObj.Topper_Name__c = eachData.Name;
                
                updateClass.add(classinsObj);
            }
            
             update updateClass;
            
        }
    }
}