import { LightningElement } from 'lwc';

export default class LoveCalculator extends LightningElement {
    
    yourname;
    crushname;
    
    yournamechange(event){
        this.yourname=event.target.value;
    }
    crushnamechange(event){
        this.crushname=event.target.value;
    }

     
     myfunction(){
        this.lovescore=Math.random()*100;
        this.lovescore2=math.floor(this.lovescore) + 1;
     }
    buttonclick(event){
           
        alert(`Your love percentage is ${Math.floor(Math.random()*100)} with your crush ${this.crushname}`)
    }


}