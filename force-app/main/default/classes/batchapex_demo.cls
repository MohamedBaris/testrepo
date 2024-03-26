global class batchapex_demo implements database.Batchable<Sobject>{
    
    
    public database.queryLocator start(database.BatchableContext bc){
        
        return database.getQueryLocator([SELECT ID,Name from Account]);
    }
    public void execute(database.BatchableContext bc,list<Account>acc){
        
        for(Account acc_list:acc){
            
            acc_list.Industry='Agriculture';
            update 	acc_list;
        }
        
    }
    public void finish(database.BatchableContext bc){
        system.debug('its finished');
    }

    
}