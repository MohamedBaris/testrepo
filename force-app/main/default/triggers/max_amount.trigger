trigger max_amount on Opportunity (after insert,after update) {

    set<id>opp_id=new set<id>();
    for(Opportunity opp:trigger.new){
        
        opp_id.add(opp.Id);
    }
    
    
    list<Opportunity>opp_list=[SELECT Amount, id, AccountId  from Opportunity 
                               where id in : opp_id order by Amount DESC NULLS LAST LIMIT 1 ];
    
    
    for(Opportunity opp:opp_list){
        
        Account acc=new Account();
        acc.Id=opp.AccountId;
        acc.total_amount_in_opp__c=opp.Amount;
        update acc;
    }
 
      
}