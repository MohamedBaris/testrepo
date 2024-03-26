import { LightningElement,wire,api } from 'lwc';
import Account_object from '@salesforce/schema/Account'
import Name_field from '@salesforce/schema/Account.Name'
import industry_field from '@salesforce/schema/Account.Industry'
import annual_revenue from '@salesforce/schema/Account.AnnualRevenue'
import {getRecord,getFieldValue,getRecordUi} from 'lightning/uiRecordApi';

export default class Getrecords extends LightningElement {
 
  @api recordId;
       accountinfo

     @wire(getRecordUi,{recordIds:['0015g000012ZDa7AAG','0035g00000lbMPiAAM'],layoutsTypes:['Full'],modes:['View']})
     recordsinfo
     /*getAccountrecord({data,error}){
      if(data){
        this.accountinfo=data;

      }
      else{
        console.log(error)
      }
     }*/
     get Accountname(){
      return getFieldValue(this.recordsinfo.data.records["0015g000012ZDa7AAG"].fields.Name.value)

     }
     get Accountindustry(){
     return getFieldValue(this.recordsinfo.data.records["0035g00000lbMPiAAM"].fields.LastName.value)

     }
}