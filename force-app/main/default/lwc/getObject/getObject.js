import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Account_obj from '@salesforce/schema/Account';

export default class GetObject extends LightningElement {

    @wire(getObjectInfo,{objectApiName:Account_obj})
    objectinfo({data,error}){
        if(data){
            console.log(data)
        }
        if(error){
            console.log(error)
        }
    }
}