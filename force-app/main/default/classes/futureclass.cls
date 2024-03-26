public class futureclass {

    
    @future
    public static void numberofcon(string find){
        
        list<Contact>con_list=(list<Contact>)JSON.deserialize(find,list<Contact>.class);
        set<id>cnt_id=new set<id>();
        for(Contact con:con_list){
            cnt_id.add(con.AccountId);
        }
       
        list<Account>acc_list=[SELECT Id,Name,number_of_record_by_future__c,(SELECT ID,LastName from Contacts) from Account where id in : cnt_id];
        for(Account acc:acc_list){
            
                acc.number_of_record_by_future__c=(integer)acc.Contacts.size();
                update acc;
            
        }
    }
}