import { LightningElement } from 'lwc';
import { Updaterecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Updaterecords extends LightningElement {

    formdata={}
    
    changeHandle(){

        const {name,value}=event.target;
        this.formdata[name]=value;
    }

updateacc()
{
    Updaterecord({apiName:'Account',fields:this.formdata})
    .then(response=>{
        console.log(response)
        this.formdata={}           
         this.dispatchEvent(new ShowToastEvent({
         title: 'the record updated',
         message: 'message'+formdata.id,
         variant: 'success'
     }));
    })
}
}