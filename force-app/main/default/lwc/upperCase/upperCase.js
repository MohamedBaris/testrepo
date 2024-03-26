import { LightningElement } from 'lwc';

export default class UpperCase extends LightningElement {
    result;
    value;
    save;
    secondvalue;
    eventhandler(event){
        this.result=event.target.value;
        this.value=this.result.slice(0,1)
        this.secondvalue=this.result.slice(1,240)
        this.save=this.value.toUpperCase() + this.secondvalue;

       
    }
}