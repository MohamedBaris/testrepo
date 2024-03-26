public with sharing class to_get_acc_rec {
    public to_get_acc_rec() {

    }

    @AuraEnabled(cacheable=true)
    public static list<Account> acc_list(string accname){
      list<Account>accountlist=new list<Account>();
        if(accname != ''){
            string accountName='%' + accname + '%';
            accountlist=[SELECT ID,Name from Account where Name like : accountName];
            return accountlist;
        }
        return accountlist;
    }
}