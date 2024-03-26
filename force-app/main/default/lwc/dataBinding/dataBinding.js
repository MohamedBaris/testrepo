import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    check=true;
    eventheandler(){
        if(this.check == true){
            this.check=false;
        } 
        else{
            this.check=true;
        }
    }
}