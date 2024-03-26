import { LightningElement,wire} from 'lwc';
import get_acc from '@salesforce/apex/getaccrec.get_acc'
export default class Getaccrecord extends LightningElement {

    inputvalue=''
    valuechange(event){
        this.inputvalue=event.target.value;
    }

    /*@wire(get_acc)
    acc({data,error}){
    if(data){   
        console.log(JSON.stringify(data));
        console.log('happened');
    }
    else if (error){
            console.log(error);
            console.log('error');

    }
}*/

valueclicked(){
    
     get_acc({acc_name:'$this.inputvalue'})
    .then(response=>{
        console.log('response clicked');
        console.log(response);
        
    })
    .catch(error=>{

    })
}
}