import {LightningElement} from 'lwc';

export default class Parentcomponent extends LightningElement {

    slidervalue;

    change(event){
       this.slidervalue=event.target.value;
    }
}