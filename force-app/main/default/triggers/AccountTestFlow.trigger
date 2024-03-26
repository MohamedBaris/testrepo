/* @description:to solve the recursion
 * @createddate:
 * @author:
 */

trigger AccountTestFlow on Account (before insert,After Insert){
    if(trigger.isBefore && trigger.isInsert){
    
    }
    if(trigger.isAfter && trigger.isInsert){
        
    }
}