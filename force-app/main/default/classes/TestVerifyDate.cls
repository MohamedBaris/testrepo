@isTest
public class TestVerifyDate {

    @isTest
    public static void testcheckdate(){
       
        date d = VerifyDate.CheckDates(system.today(), system.today()+1);
        date d1 =VerifyDate.CheckDates(system.today(), system.today()+60);
}
}