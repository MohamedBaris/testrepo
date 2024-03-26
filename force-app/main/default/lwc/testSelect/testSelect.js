import { LightningElement } from 'lwc';

export default class TestSelect extends LightningElement {
    finput
    eventhandler(event){
        this.finput=event.target.value
    }
    buttonclick(){
        console.log(this.finput)
        
    }
}