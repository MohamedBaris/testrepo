import { LightningElement,wire} from 'lwc';
import { getObjectInfo,getObjectInfos} from 'lightning/uiObjectInfoApi';
import acc from '@salesforce/schema/Account'
import opp from '@salesforce/schema/Opportunity'

export default class FirstObject extends LightningElement {

name=[acc,opp]

    @wire(getObjectInfos,{objectApiName: '$name' })
    handler({data,error}){
        if(data){
        console.log(data)
    }
    if(error){
        console.log(error)
    }
}
}