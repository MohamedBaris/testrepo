public class comboboxclass2{

        @AuraEnabled(cacheable=true)
        public static list<Account> combofunction(){
            return [SELECT Id, Name, Industry, Rating FROM Account];
        }

        
    }