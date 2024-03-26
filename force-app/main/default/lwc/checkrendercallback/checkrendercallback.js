import { LightningElement } from 'lwc';

export default class Checkrendercallback extends LightningElement {
    isboolean=true;
    callback='before render callback call';
    constructor(){
        super();{

        }
    }
    connectedCallback(){

    }
    renderedCallback(){
        if(this.isboolean){
        this.callback='after render callback';
        this.isboolean=false;
    }
}
    valuechange(event){
        this.callback=event.target.value;
    }

}