import { LightningElement,track} from 'lwc';

export default class Pusharray extends LightningElement {
    inputvalue
    @track valuepush=[]

    valuechange(event){
       this.inputvalue=event.target.value;
       
    }
 
    buttonclick(){
       this.valuepush.push(this.inputvalue);
       this.imputvalue=' '

    }
    clearclick(){
        this.valuepush=' ';
    }
}