trigger SalesRespresAcc on Account (after insert) {
    List<Account> accList = new List<Account>();
    string ownierId = '';
    string accid = '';
    for(Account each :Trigger.new){
        ownierId = each.ownerId;
        accid = each.Id;
    }
    user userData = [SELECT Name, Id FROM User where id =: ownierId];
    Account acc = new Account();
    acc.id = accid;
    acc.Sales_Representative__c = userData.name;
    accList.add(acc);
    update accList;
}