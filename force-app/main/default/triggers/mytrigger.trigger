trigger mytrigger on Account (After update) {

    set<id>acc_id=new set<id>();
    for(Account acc:trigger.new){
        if(acc.Type != trigger.oldmap.get(acc.Id).Type){
            acc_id.add(acc.id);
        }
    }
    
    if(acc_id.size() > 0){
        list<Account>acc_list=[SELECT ID,Name,Type,Industry From Account WHERE ID in :acc_id AND Type='Prospect'];
        
        for(Account acc:acc_list){
            acc.Industry='Agriculture';
            update acc;
        }
    }
    
}