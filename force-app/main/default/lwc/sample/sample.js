import { LightningElement } from 'lwc';

export default class Sample extends LightningElement {
    value='welcome';
    changehello(){
        this.value='hello';
    }
    changehi(){
        this.value='hi'
    }
}