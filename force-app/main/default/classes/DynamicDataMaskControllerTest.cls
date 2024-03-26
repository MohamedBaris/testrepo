@IsTest
private class DynamicDataMaskControllerTest {
    
    @Testsetup
    static void testInitMethod() {
        // Create test data
        MaskObject__c maskObject = new MaskObject__c(
            Record_Name__c = 'Contact',
           // Is_Active__c = true,
            Define_Record_No_for_one_batch__c=1
        );
        insert maskObject;
        
        MaskField__c maskField = new MaskField__c(
            Name = 'Name',
            Mask_values__c = 'Testclass',
            MaskObject__c = maskObject.Id
        );
        insert maskField;
        
         /*MaskField__c maskField2 = new MaskField__c(
            Name = 'Ability__c',
            Mask_values__c = '1',
            MaskObject__c = maskObject.Id
        );
        insert maskField2;
        
         MaskField__c maskField3 = new MaskField__c(
            Name = 'Flexibility__c',
            Mask_values__c = '11',
            MaskObject__c = maskObject.Id
        );
        insert maskField3;
        
         MaskField__c maskField4 = new MaskField__c(
            Name = 'Available_From__c',
            Mask_values__c = '22/01/2002',
            MaskObject__c = maskObject.Id
        );
        insert maskField4;*/
        
        
    }
    
    
    static testMethod void testApplicationHiringManagerShare(){
     Contact con=new Contact();
        con.LastName='check';
        insert con;    
    }
    
    @isTest
    static void testbatch(){
        testApplicationHiringManagerShare();
        list<MaskObject__c>Maskobj=[SELECT id from MaskObject__c];
        Test.startTest();
          DynamicDataMaskController.init(Maskobj[0].Id);
        Test.stopTest();
    }
    
  
}