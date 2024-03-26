trigger contype on Contact (after update) {
 
    set<id>con_ids=new set<id>();
    
    for(Contact con:trigger.new){
        con_ids.add(con.id);
        
    }
    
    list<Contact>con_list=[SELECT ID, LastName, Account.Id, Account.Type, LeadSource, AccountId from Contact where id in : con_ids and LeadSource='Web'];
    list<Account>acc_list=new list<Account>();
    for(Contact con:con_list){
      Account acc=new Account();
        acc.type='Prospect';
        acc.id=(id)con.get('AccountId');
         acc_list.add(acc);
    }
    update acc_list;
}