trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {

    list<task>tasklist=new list<task>();
    
    if(trigger.isAfter && trigger.isInsert){
    for(Opportunity opp:trigger.new){
   if(opp.StageName == 'Closed Won'){
        task newtask=new task();
        newtask.Subject='Follow Up Test Task';
        newtask.Status='Completed';
       system.debug('status complted');
       newtask.WhatId=opp.Id;
         tasklist.add(newtask);
            system.debug(tasklist.size());
    }
    }
        if(tasklist.size() > 0){
        insert tasklist;
    }
    }
    if(trigger.isAfter && trigger.isupdate){
        
    for(Opportunity opp:trigger.new){
         if(opp.StageName == 'Closed Won'){
        task newtask=new task();
        newtask.Subject='Follow Up Test Task';
        newtask.Status='Completed';
        newtask.WhatId=opp.id;
         tasklist.add(newtask);
    }
    }
        if(tasklist.size() > 0){
        update tasklist;
    }
    }
}