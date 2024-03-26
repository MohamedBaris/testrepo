import { LightningElement } from 'lwc';

export default class ColourChange extends LightningElement {
    defaultcolour
    btn
    
    handlerChange(event){
        this.btn=event.target.value;
    }

    colorchangedisplay(event){

        if(event.target.name == "red"){
            console.log('jhsc')
            this.defaultcolour='redcolor'
            //this.uservalue='redcolor'
        }
        else if(event.target.name == "blue"){
            this.defaultcolour='bluecolor'
           // this.uservalue='bluecolor'
        }
        else if(event.target.name == "green"){
            this.defaultcolour='greencolor'
        }
    }
}