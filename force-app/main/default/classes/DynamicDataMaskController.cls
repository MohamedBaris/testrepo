public class DynamicDataMaskController {

    public static string jobid;
    
    @AuraEnabled
    public static string init(string recid){
        boolean checkSandbox = DynamicDataMaskController.runningInASandbox();
        boolean check=false;
        if(checkSandbox || Test.isrunningTest()) {
            string ids = recid;
            system.debug('recid' + ids);
            list<MaskField__c> ChildRecords = [SELECT ID, Name, Mask_values__c, MaskObject__r.Record_Name__c, is_concatenate__c, MaskObject__r.Define_Record_No_for_one_batch__c,MaskObject__r.Is_Active__c,MaskObject__r.Status__c,MaskObject__r.Success_Record_Count__c,MaskObject__r.Error_Count_Records__c FROM MaskField__c WHERE MaskObject__c = :recid];
            
            system.debug(ChildRecords.size());        
            String parentObjectName = (ChildRecords != null && !ChildRecords.isEmpty()) ? ChildRecords[0].MaskObject__r.Record_Name__c : null;
            integer RecordsinBatch = (integer)ChildRecords[0].MaskObject__r.Define_Record_No_for_one_batch__c;
            list<MaskObject__c>MaskObj=[SELECT id,Record_Name__c,Is_Active__c from MaskObject__c where Is_Active__c=true AND Record_Name__c=:parentObjectName];
            
                if(MaskObj.size() == 1){
                    if(RecordsinBatch <= 2000 && RecordsinBatch > 0){
                         id  ObjId=ChildRecords[0].MaskObject__r.id;
                        MaskObject__c maskObject = new MaskObject__c();
                    maskObject.Success_Record_Count__c = 0;
                    maskObject.Error_Count_Records__c = 0;
                    maskObject.Status__c = 'Processing';
                        maskObject.id=ObjId;
                    update maskObject;
                 DynamicDataMask obj = new DynamicDataMask(parentObjectName, ChildRecords, ids);    
                jobid = Database.executeBatch(obj, RecordsinBatch);
                        
                    }
                    else{
                        return 'batchsize';
                    }
                    
                }
                else{
                   return 'active';
                }
                  return 'run';            
            }
           return 'prod';
        } 
    
    
    
    public static Boolean runningInASandbox() {
        return [SELECT Id, IsSandbox FROM Organization LIMIT 1].IsSandbox;
    }
 
    public class My1Exception extends Exception {} 
}