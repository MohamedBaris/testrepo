@isTest
public class AccountProcessorTest {

    
    @isTest
    public static void testcount(){
        
        Account acc=new Account();
        acc.Name='Baris';
        insert acc;
        
        list<Contact>con_list=new list <Contact>();
        Contact con=new Contact(LastName='LAstNAme1',AccountId=acc.ID);
        con_list.add(con);
        
        contact con1=new Contact(LastName='LastName2',AccountId=acc.Id);
        con_list.add(con1);
        
        insert con_list;
        set<id>acnt_id=new set<id>();
        acnt_id.add(acc.id);
        
        Test.startTest();
        AccountProcessor.countContacts(acnt_id);
        Test.stopTest();
    }
}