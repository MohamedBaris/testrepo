import { LightningElement } from 'lwc';

export default class Tryudemy extends LightningElement {
    valuechange="yes"


    changehandle(){
   this.valuechange=event.target.value;
    }  
    arr=['Mohamed','BAris']

    get fName(){
       return this.arr[0]
    }
    get sName(){
        return this.arr[1]
    }
}