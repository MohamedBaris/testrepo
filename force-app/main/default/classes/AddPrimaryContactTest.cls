@isTest
public class AddPrimaryContactTest{
    
    @isTest 
    static void TestList()
     {
         List<Account> Teste = new List <Account>();
         for(Integer i=0;i<50;i++)
         {
             Teste.add(new Account(BillingState = 'CA', name = 'Test'+i));
         }
         for(Integer j=0;j<50;j++)
         {
             Teste.add(new Account(BillingState = 'NY', name = 'Test'+j));
         }
         insert Teste;

         Contact co = new Contact();
         co.FirstName='demo';
         co.LastName ='demo';
         insert co;
         String state = 'CA';
      
          AddPrimaryContact apc = new AddPrimaryContact(co, 'state');
          Test.startTest();
            System.enqueueJob(apc);
          Test.stopTest();
         
         set<id>sets=new set<id>();
         for(Account acc:Teste){
             if(acc.BillingState == 'CA'){
            sets.add(acc.id);
         }
         }
         system.debug(sets.size());
         system.assertEquals(50,[SELECT count() from Contact where AccountId in : sets]);
      }
}