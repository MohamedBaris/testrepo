trigger numberofcases on Case (After insert) {
    
    
    
    list<Aggregateresult>acc_list=[SELECT COUNT(Id)noofids,AccountId from Case group by AccountId];
   
    for(Aggregateresult agg:acc_list) {
        Account acc=new Account();
        acc.Id=(id)agg.get('AccountId');
        acc.numberofcases__c=(integer)agg.get('noofids');
        update acc;
    }
}