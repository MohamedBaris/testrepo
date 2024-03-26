public class LeadProcessor implements Database.Batchable<sObject> {

    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return database.getQueryLocator([SELECT ID,Leadsource from lead]);
    }
    list<lead>lead_list=new list<lead>();
    public void execute(Database.BatchableContext bc,list<Lead>scope){
        
        for(Lead leads:scope){
            leads.Leadsource='Dreamforce';
            lead_list.add(leads);
        }
        update lead_list;
    }
    public void finish(Database.BatchableContext bc){
        system.debug('the dreamforce executed');
    }
}