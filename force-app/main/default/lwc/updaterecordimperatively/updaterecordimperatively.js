import { LightningElement,api} from 'lwc';
import updatefunction from '@salesforce/apex/updaterecacc.updatefunction'

export default class Updaterecordimperatively extends LightningElement {
 amountvalue
  @api recordId;

  valuechange(event){
this.amountvalue=parseInt(event.target.value)
  }

  buttonclick(){
        alert('the button clicked')
        console.log('valueclicked')
        updatefunction({recid:'$recordId',amt:'$amountvalue'})
        .then(res=>{
            console.log('Revenue updated')
        })
        .catch(err=>{
            console.log(err)
        })
        console.log('its called')
    }
}