import { LightningElement } from 'lwc';
import order_object from '@salesforce/schema/Order'
import accid_order from '@salesforce/schema/Order.AccountId' 
import order_status from '@salesforce/schema/Order.Status'
import order_date from '@salesforce/schema/Order.EffectiveDate'

export default class Order extends LightningElement {

orderobject=order_object;
myfields=[accid_order,order_status,order_date];
create=' ';

handleAccountCreated(){
    this.create='The record created'
}
}