import { LightningElement,wire,track} from 'lwc';
import getproductname from '@salesforce/apex/productname.getproductname';
const columns = [
    { label: 'Label', fieldName: 'Name' },
    { label: 'Website', fieldName: 'website', type: 'url' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Balance', fieldName: 'amount', type: 'currency' },
    { label: 'CloseAt', fieldName: 'closeAt', type: 'date' },
];
export default class Radio_button extends LightningElement {

    columns = columns;
    p_value=' ';
    @track productlist;
    @track value;
  
    get options(){
        return [
            { label: 'Product Name', value: 'option1' },
            { label: 'Product Brand', value: 'option2' },
            { label: 'MRP', value: 'option3'}
        ];
}

productchange(event){
    console.log(event.target.value)
this.p_value=event.target.value;
}


@wire(getproductname,{PName:'$p_value'})
getprodudctnamevalue({error,data}){
    if(data){
        console.log(JSON.stringify(data))
 this.productlist=data
}else{
    console.log(JSON.stringify(error))
}
}
}