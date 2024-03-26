import { LightningElement} from 'lwc';

export default class Forinterview2 extends LightningElement {

    ans=' ';
    datafromchild(event){
   this.ans=event.detail;
    }
}