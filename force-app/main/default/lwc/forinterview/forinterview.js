import { LightningElement,api} from 'lwc';

export default class Forinterview extends LightningElement {


    childvalue=' ';
    childchange(event){
      this.childvalue=event.target.value;
    }
      

    clickchild(){
        this.dispatchEvent(new CustomEvent('pass',{
            
            detail:this.childvalue
        }))
    }
}