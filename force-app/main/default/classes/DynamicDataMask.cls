public class DynamicDataMask implements Database.Batchable<sObject>, Database.Stateful {

    string parentObjectName;
    list <MaskField__c> ChildMaskrecords = new list <MaskField__c>();
    Integer successCount = 0;
    Integer errorCount = 0;
    string ParentobjectRecid;
  
    //List<Database.SaveResult> results = new List<Database.SaveResult>();

    public DynamicDataMask(string parentObjectName, list<MaskField__c> ChildRecords, string ParentobjectRecid) {
        this.parentObjectName = parentObjectName;
        this.ChildMaskrecords = ChildRecords;
       this.ParentobjectRecid = ParentobjectRecid;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Map to store describe information for fields
        Map<String, Schema.DescribeFieldResult> fieldDescribeMap = new Map<String, Schema.DescribeFieldResult>();

        // Populate fieldDescribeMap with field describes
        Map<String, Schema.SObjectField> fieldsMap = Schema.getGlobalDescribe().get(parentObjectName).getDescribe().fields.getMap();

        // Build query string
        String queryString = 'SELECT Id';
        for (MaskField__c maskField : ChildMaskrecords) {
            String fieldName = maskField.Name;
            
            if (fieldsMap.containsKey(fieldName)) {
                Schema.DescribeFieldResult fieldDescribe = fieldsMap.get(fieldName).getDescribe();
                fieldDescribeMap.put(fieldName, fieldDescribe);
                queryString += ', ' + fieldName;
            }
        }
   queryString += ' FROM ' + parentObjectName;

     //  queryString += ' FROM ' + parentObjectName + ' WHERE Id = \'a5gAe00000010afIAA\'';

        return Database.getQueryLocator(queryString);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        try {
             Map<Object, Object> ParentObjectMap = new Map<Object, Object>();
             object value;
             object ObjectValue;
            for (Sobject item : scope) {
                for (MaskField__c maskstring : ChildMaskrecords) {
                    String fieldName = maskstring.Name;
                    ObjectValue = item.get(fieldName);
                       
                    if (ObjectValue != null) {
                        ParentObjectMap.put(fieldName, ObjectValue);
                    }
                  
                    if (ParentObjectMap.containskey(maskstring.Name)) {
                        value = ParentObjectMap.get(maskstring.Name);
                        if (value != null) {

                            if (value instanceof Decimal) {

                                string singlevalue = maskstring.Mask_values__c;
                                List<string> values = singlevalue.split(',');
                                Integer randomIndex = (Integer)Math.floor(Math.random() * values.size());
                                String randomValue = values[randomIndex];
                                decimal maskedvalue = decimal.valueof(randomValue);
                                if (maskstring.is_concatenate__c == true) {
                                    item.put(maskstring.Name, ParentObjectMap.get(maskstring.Name) + '' + maskedvalue);
                                } else {
                                    item.put(maskstring.Name, maskedvalue);
                                }
                            } else if (value instanceof Integer) {
                                string singlevalue = maskstring.Mask_values__c;
                                List<String> values = singlevalue.split(',');
                                Integer randomIndex = (Integer)Math.floor(Math.random() * values.size());
                                String randomValue = values[randomIndex];
                                if (maskstring.is_concatenate__c == true) {
                                    item.put(maskstring.Name, ParentObjectMap.get(maskstring.Name) + '' + randomValue);
                                } else {
                                    item.put(maskstring.Name, Integer.valueof(randomValue));
                                }
                            } else if (value instanceof String) {

                                string singlevalue = maskstring.Mask_values__c;
                                List<String> values = singlevalue.split(',');
                                Integer randomIndex = (Integer)Math.floor(Math.random() * values.size());
                                String randomValue = values[randomIndex];
                                
                               
                                    system.debug('the value'+''+maskstring.Name+''+randomValue);
                                    item.put(maskstring.Name, randomValue);
                                
                            } else if (value instanceof date) {
                                string singlevalue = maskstring.Mask_values__c;
                                List<String> values = singlevalue.split(',');
                                Integer randomIndex = (Integer)Math.floor(Math.random() * values.size());
                                String randomValue = values[randomIndex].trim();
                                List<String> dateParts = randomValue.split('/');
                                Integer day = Integer.valueOf(dateParts[0]);
                                Integer month = Integer.valueOf(dateParts[1]);
                                Integer year = Integer.valueOf(dateParts[2]);
                                date dateValue = Date.newInstance(year, month, day);
                                item.put(maskstring.Name, datevalue);
                            }
                        } else {

                        }
                    } else {

                    }
                }

            }
       
           Database.SaveResult[] result = Database.update(scope,false);
            list<Error_Log__c>insertErrorRecS=new list<Error_Log__c>();
    for(Integer i=0; i < result.size(); i++) {
        if(result.get(i).isSuccess()) {
            successCount++;
        } 
        else if(!result.get(i).isSuccess()) {
             errorCount++;
            Database.Error errors =  result.get(i).getErrors().get(0);
            System.debug('Error Occurs While Processing The Record'+errors.getMessage());
            System.debug('Failure Record Ids While Updating'+result.get(i).Id);
            
                    Error_Log__c ErrMsg =new Error_Log__c();
                    ErrMsg.MaskObject__c=ParentobjectRecid;
                    ErrMsg.Error_Message__c=errors.getMessage();
                    ErrMsg.Name=result.get(i).Id;
                    insertErrorRecS.add(ErrMsg);
        }
    }  
           insert insertErrorRecS;
            
        } catch (exception e) {
            system.debug('the following error' + e.getmessage());
            system.debug(e.getLineNumber());
        }
    }

       public void finish(Database.BatchableContext BC) {
    
         

        MaskObject__c obj = [SELECT Error_Count_Records__c, Success_Record_Count__c,Status__c FROM MaskObject__c WHERE Id = :ParentobjectRecid];
        
        obj.Error_Count_Records__c = (obj.Error_Count_Records__c != null ? obj.Error_Count_Records__c : 0) + errorCount;
        obj.Success_Record_Count__c = (obj.Success_Record_Count__c != null ? obj.Success_Record_Count__c : 0) + successCount;
       obj.Status__c='Completed';
        update obj;
           
       // system.debug(successCount);
    }
}