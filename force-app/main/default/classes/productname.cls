public with sharing class productname {

    @AuraEnabled(cacheable=true)
    public static list<Product2> getproductname(string PName){

        string pro_name='%' + PName + '%';

        list <Product2> p_list=[SELECT Name,ProductCode,MRP__c,In_Stock__c from Product2 where Name like : pro_name];
        return p_list;
    }
     
    }