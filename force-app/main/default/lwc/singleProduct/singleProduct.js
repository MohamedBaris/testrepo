import { LightningElement } from 'lwc';

export default class SingleProduct extends LightningElement{
         stockinput;
           productname;
           productprice;
           productstock;
           visible=true;
           clearvisible;
    stockchange(event){
       this.stockinput=event.target.value;
    }
    
    product={
        name:'chocolate',
        price:20,
        stock:0
    }
    eventhandler(){
        
        if(this.stockinput > 0){
        this.productname=this.product.name;
        this.productprice=this.product.price;
        this.productstock=this.product.stock + parseInt(this.stockinput);
     }
     else{
        //this.productname=" ";
       // this.productprice=" ";
        //this.productstock="the stock is not available";
        this.visible=false;
        this.clearvisible='the stock is not available';

     }
    }
    clearhandler(){
      this.productname=" ";
      this.productprice=" ";
      this.productstock=" ";
      this.clearvisible=" ";
    }
}