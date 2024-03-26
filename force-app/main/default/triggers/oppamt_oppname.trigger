trigger oppamt_oppname on Opportunity (after update) {

    set<id>opp_id=new set<id>();
    for(Opportunity opp:trigger.new){
       if(opp.Amount != trigger.oldmap.get(opp.Id).Amount) 
        opp_id.add(opp.AccountId);
    }
    list<Account>acc_list=[SELECT Name,Description,Industry,(SELECT ID,Name,Amount from Opportunities) from Account where id in :opp_id];
    
    
    for(Account acc:acc_list){
       
        for(Opportunity opp:acc.Opportunities){
        acc.Description=opp.Amount + '-' + opp.Name + '-' + acc.Industry;
        update acc;
    }
    }
}