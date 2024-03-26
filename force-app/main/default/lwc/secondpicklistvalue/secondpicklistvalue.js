import { LightningElement,wire} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';

export default class Secondpicklistvalue extends LightningElement {
   
    userId = Id
    userdetail
    @wire(getRecord,{recordId:'$userId',fields:['User.Name','User.Email']})
    userdetailhandler({data,error}){
    if(data){
    this.userdetail=data.fields
    console.log(data)
    }
    if(error){
        console.log(error)
    }
}



}