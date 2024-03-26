trigger interview on Contact (before insert) {
    
    /*set<id>acnt_id=new set<id>();
    for(Contact con:trigger.new){
        acnt_id.add(con.AccountId);
    }
    list<Account>acc_list=[SELECT Id,Name,(SELECT Id,LastName from Contacts) from Account where id in :acnt_id];
    
    for(Account acc:acc_list){
       for(Contact con:acc.Contacts){
           try{
        if(Math.Mod(acc.Contacts.size(), 2) == 0){
           Con.addError('if record in even we cant insert the record');
        }
           }
           catch(exception e){
               con.addError('if record in even we cant insert the record');
               system.debug('erorr');
           }
           
           
        }
        
    }  */ 
    
    list<Contact>con_list=[SELECT Id,LastName FROM Contact where id in : trigger.new];
    
    for(Contact con:con_list){
        if(con_list.size() /2 == 0){
            con.id.addError('kjqbf');
        }
    }
        
}