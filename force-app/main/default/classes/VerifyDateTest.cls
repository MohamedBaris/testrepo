@isTest
public class VerifyDateTest {

    @isTest
    public static void testcheckdate(){
       
        date d = VerifyDate.CheckDates(system.today(), system.today()+1);
        date d1 =VerifyDate.CheckDates(system.today(), system.today()+60);
}
}