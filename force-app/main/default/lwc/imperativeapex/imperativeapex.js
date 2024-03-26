import { LightningElement,wire} from 'lwc';
import getapexclass from '@salesforce/apex/apexclass.getapexclass';
export default class Imperativeapex extends LightningElement {
    value='Agriculture'
    acc
    showdata=false;
    changeHandle(){   
        this.showdata=true;         
        getapexclass().then(result=>{
          this.acc=result
        }).catch(error=>{
          console.log(error)
        })
    }
    changeHandle1(){
    this.showdata=false;
    }
}