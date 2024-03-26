import { LightningElement } from 'lwc';
import Account_object from '@salesforce/schema/Account'
import Account_name from '@salesforce/schema/Account.Name'
import Account_industry from '@salesforce/schema/Account.Industry'
import Account_annual_revenue from '@salesforce/schema/Account.AnnualRevenue'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class CreateACC extends LightningElement {

   obj_name=Account_object;
   name_value=Account_name;
   industry_value=Account_industry;
   annualrevenue_value=Account_annual_revenue;
  
   successhandler(event){
      this.dispatchEvent(new ShowToastEvent({
         title:'the record create successfully',
         message: event.detail.message,
         variant: 'success'
      }))
     
   }
   submithandler(event){

      event.preventDefault();
  
     const ann=this.template.querySelector(".revenue")

     if(ann.value < 200){
  
      this.dispatchEvent(new ShowToastEvent({
         title:'the annual revenue should not be less than 200',
         message: event.detail.message,
         variant: 'error'
      }))
     }

     else{
      const fields=event.detail.fields;
       this.template.querySelector('ightning-record-edit-form').submit(fields)

     }
   }
   errorhandler(){

   }
}