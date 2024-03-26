import { LightningElement,api } from 'lwc';
import init from '@salesforce/apex/DynamicDataMaskController.init';
	
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class DynamicDataMaskLWC extends LightningElement {

 @api recordId;

    @api invoke() {
        init({ recid: this.recordId })
            .then(result => {
             if(result == 'active'){
                 console.log('actives');
          const evt = new ShowToastEvent({
        title: 'error',
        message: 'We have already active record',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
             }
             else if(result == 'batchsize'){
                 console.log('batchsize');
                  const evt = new ShowToastEvent({
        title: 'error',
        message: 'Please give Batch size between 1 to 2000',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
             }
             else if(result == 'prod'){

                  const evt = new ShowToastEvent({
        title: 'error',
        message: 'Data Mask Solution only run in Sandbox',
        variant: 'error',
        mode: 'dismissable'
    });
            this.dispatchEvent(evt);   
             }
             else{
                     const evt = new ShowToastEvent({
        title: 'Success',
        message: 'Batch class started',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
             }
                
            })
            .catch(error => {
                console.log(error);
                console.error('error');
            });
    }
}