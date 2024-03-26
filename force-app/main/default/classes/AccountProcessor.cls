public class AccountProcessor {
    
    @future
    public static void countContacts(set<id>acntId){
        
        list<Account>acc_list=[SELECT ID,Name,Number_Of_Contacts__c, (SELECT ID, LastName from Contacts) from Account where id in :acntId];
        system.debug('before for');
        list<Account>acc_updatelist=new list<Account>();
        for(Account acc:acc_list){
            
            acc.Number_Of_Contacts__c=acc.Contacts.size();
            acc_updatelist.add(acc);
            system.debug('its run');
        }
        update acc_updatelist;
    }
}