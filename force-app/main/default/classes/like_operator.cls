public class like_operator {

    public static void function(string a){
        string b='%'+ a + '%';
        list<Account>acc_list=[SELECT Name from Account where Name like :b];
        system.debug(acc_list);
    }
}