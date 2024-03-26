import { LightningElement } from 'lwc';

export default class Parencomponenet extends LightningElement {

   visible=false

   closemodel(){
    const myevent= new CustomEvent('close')
    this.dispatchEvent(myevent)
   }
}