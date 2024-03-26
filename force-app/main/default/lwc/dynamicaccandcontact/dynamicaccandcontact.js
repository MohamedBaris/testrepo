import { LightningElement } from 'lwc';
import acc from './accpage.html'
import con from './conpage.html'



export default class Dynamicaccandcontact extends LightningElement {
  showacc=false;
  showcon=false;

  Click(event){
    this.showacc=!this.showacc;  
  }
  Click1(event){
    this.showacc=!this.showacc;  
  }

  render(){ 
    return this.showacc ? acc:con;
  } 
}