@isTest
private class MyTest {

    //change
    @isTest
    static void myUnitTest() {
        MyClass demo = new MyClass();
        System.assertEquals(demo.getAppVersion(), '1.0.0');
        system.debug('test class');
        
    }
}