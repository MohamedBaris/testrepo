public class beforeInsert {
    
    public static void brforefunction(){
        
    list<Account>acclist=new list<Account>();
        for(integer i=0;i<500;i++){
    Account acc=new Account();
        acc.Name='test1';
        acclist.add(acc);
    }
        insert acclist;
    }

}