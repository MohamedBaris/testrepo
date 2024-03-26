@isTest
public class LeadProcessorTest {

    @testSetup
    public static void leadmethod(){
        
        
        list<lead>lead_list=new list<lead>();
        for(integer i=1;i<=200;i++){
            
            lead leads=new lead();
            leads.LastName='BARIS'+i;
            leads.Company='BARIS COMPANY'+i;
            leads.Status='Open - Not Contacted';
            leads.LeadSource='Dreamforce';
            lead_list.add(leads);
        }
        insert lead_list;
                
    }
    @istest
    public static void testlead(){
        
        test.startTest();
        
        LeadProcessor uca=new LeadProcessor();
        Database.executeBatch(uca);
        
        Test.stopTest();
         system.assertEquals(200, [select count() from lead where LeadSource='Dreamforce']);
    }
    
   
}