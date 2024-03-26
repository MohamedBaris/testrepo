@IsTest
public class accTestClass{ 
    
    @TestSetup
     public static void isinsert(){
    list<Account>Acc_list=new list<Account>();
     for(integer i=1;i<=100;i++){
          Account obj=new Account();
         obj.Name='test Account'+i;
         Acc_list.add(obj);
     }
    insert Acc_list; 
    } 
    @IsTest
    public static void dotest(){
        list<Account>acc_update=[SELECT ID,CustomerPriority__c,Type from Account];
        for(Account acc:acc_update){
            acc.Type='Customer - Direct';
        }
          update acc_update;
        map<id,Account>acc_map=new map<id,Account>();
        list<Account>find_map=[SELECT ID,Name from Account];
        for(Account a:find_map){
            acc_map.put(a.id,a);
        }
        list<task>task_list=[SELECT Subject,WhatId from task where WhatId in :acc_map.keyset()];
        system.assertEquals(acc_map.size(),task_list.size(), 'the error occur');
    }
}