trigger checkerror on Account (before insert,before update) {

     Integer characterLimit = 5;
    
    if(trigger.isBefore && trigger.isInsert){
        
        for (Account record : Trigger.new) {
       
        if (record.AccountNumber != null && record.AccountNumber.length() > characterLimit) {
           record.AccountNumber.addError('Rich Text Area field cannot exceed 5 characters.');
        }
    }
    }
    
    if(trigger.isBefore && trigger.isUpdate){
        
         Integer characterLimit = 5;
    
    for (Account newRecord : Trigger.new) {
        Account oldRecord = Trigger.oldMap.get(newRecord.Id);
        
 
        if (newRecord.AccountNumber != oldRecord.AccountNumber) {
            // Check if the new value exceeds the character limit
            if (newRecord.AccountNumber != null && newRecord.AccountNumber.length() > characterLimit) {
                // Throw an error
                newRecord.AccountNumber.addError('Rich Text Area field cannot exceed 5 characters.');
            }
        }
    }
    }
    
}