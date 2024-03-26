import { LightningElement, wire } from 'lwc';
import getapexclass from '@salesforce/apex/apexclass.getapexclass';

export default class picklistvalue extends LightningElement{
  
  value='Agriculture'
  @wire(getapexclass,{pass:'$value'})
  filteracc


  get typeofoption(){
    return [
      {label:"Agriculture", value:"Agriculture"},
      {label:"Apparel", value:"Apparel"},
      {label:"none", value:"none"}
    ]
  }

  valuechange(event){
   this.value=event.target.value
  }
}