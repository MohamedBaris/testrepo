public class getaccrec {
    
    @AuraEnabled(cacheable=true)
    public static list<Account> get_acc(string acc_name){
        string acnt_name = '%'+ acc_name +'%';
        list<Account>accs_list=[SELECT id, Name, Industry from Account where Name like :acnt_name];
        return accs_list;
    }
}