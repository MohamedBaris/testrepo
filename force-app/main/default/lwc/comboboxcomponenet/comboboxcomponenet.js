import { LightningElement,wire} from 'lwc';
import   combofunction from '@salesforce/apex/comboboxclass2.combofunction'
import { getDataConnector } from 'lightning/analyticsWaveApi';

export default class Comboboxcomponenet extends LightningElement {

    acclist;
    value;
    rating;
    

   /* get options(){
        return [
            { label: 'Hot', value: 'Hot' },
            { label: 'Warm', value: 'Warm' },
            { label: 'Cold', value: 'Cold' },
        ];
    }


    handleChange(event){
     this.rating=event.target.value;
     console.log('value')
    }

    
      @wire(combofunction3,{rating :'$rating'})
      acchandler({data,error}){
        if(data){
           //this.acclist=data; 
           console.log('check')
           console.log(data)
        }
        else{
            console.log(error)
        }

      } */  
      
     @wire(combofunction)
      getDataConnector({data,erorr})
      {
        if(data){
          console.log(data)
          this.acclist=data;
        }
      }   
    
}