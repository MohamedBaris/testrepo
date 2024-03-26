public with sharing class apexclass {
    @AuraEnabled(cacheable=true)  
    public static list<Account> getapexclass() {
       return [SELECT Id,Name,Industry from Account where Industry ='Agriculture'];
    }
}