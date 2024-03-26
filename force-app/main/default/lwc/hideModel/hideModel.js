import { LightningElement } from 'lwc';

export default class HideModel extends LightningElement {
    displaymodel=false;

    launchmodel(){
        this.displaymodel=true;
    }
    erasemodel(){
        this.displaymodel=false;
    }
}