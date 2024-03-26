import { LightningElement } from 'lwc';
export default class Testonblur extends LightningElement {
value;
value2;
HandleChange(event){
     this.value2=event.target.value;
      console.log(this.value2);
   this.value=event.target.name;
   console.log(this.value);
alert('on blur fires');
value.focus();
}
}