import { LightningElement} from 'lwc';

export default class Childcomponent extends LightningElement {

    visible=false
   
    childhandler(){
        this.visible=true
    }
    okclose(event){
        this.visible=false
        this.msg=event.detail
    }
 
    }