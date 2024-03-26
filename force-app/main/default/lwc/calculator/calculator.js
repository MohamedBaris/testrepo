import { LightningElement,track } from 'lwc';

export default class Calculator extends LightningElement{
    @track secondvalue;
    @track firtsvalue;
    @track result;

    firstchange(event){
        this.firtsvalue=event.target.value;
    }
    secondchange(event){
        this.secondvalue=event.target.value;
    }

    addvalue(event){
        if(event.target.name == "btn-add"){
         this.result=parseInt(this.firtsvalue) + parseInt(this.secondvalue);
        }
        else if(event.target.name == "btn-sub"){
            this.result=parseInt(this.firtsvalue) - parseInt(this.secondvalue);
        }
        else if(event.target.name == "btn-mul"){
            this.result=parseInt(this.firtsvalue) * parseInt(this.secondvalue);
        }
        else if(event.target.name == "btn-div"){
             this.result=parseInt(this.firtsvalue) / parseInt(this.secondvalue);
        }
        else{
            this.firtsvalue =" " ;
            this.result=" " ; 
            this.secondvalue=" " ;
            
        }
    }
    
}