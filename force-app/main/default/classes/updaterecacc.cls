public class updaterecacc {
   
  
        @AuraEnabled
        public static void updatefunction(string recid,integer amt) {
        
            Account acc=new Account();
            acc.Id=recid;
            acc.AnnualRevenue=amt;
            update acc;

    }
}