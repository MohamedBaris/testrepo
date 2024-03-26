@istest
public class TestRestrictContactByName {

    @istest
    public static void restictname(){
        contact con =new contact();
        con.LastName='INVALIDNAME';
    
        
          Test.startTest();
          database.SaveResult result= database.insert(con,False);
          Test.stopTest();
        
        system.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',result.getErrors()[0].getmessage());
    }
    

}