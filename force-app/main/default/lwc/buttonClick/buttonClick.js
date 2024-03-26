import { LightningElement } from 'lwc';

export default class ButtonClick extends LightningElement {
    storevalue='defaultstyle'
    redkey(event){
        this.storevalue='redstyle'
    }
    bluekey(event){
        this.storevalue='bluestyle'
    }
}