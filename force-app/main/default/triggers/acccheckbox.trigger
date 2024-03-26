trigger acccheckbox on Account (After update,After insert) {

    
    
    for(Account acc:[SELECT Id,Name from Account where id in :trigger.new]){
        if(acc.Name.contains('567')){
             contact con=new contact();
            con.AccountId=acc.id;
            con.If_acc_has_number__c=true;
            update con;
        }
    }
}