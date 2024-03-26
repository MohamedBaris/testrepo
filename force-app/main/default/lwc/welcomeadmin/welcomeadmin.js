import { LightningElement } from 'lwc';
import acc from './new.html'
import acc2 from './change2.html'

export default class Welcomeadmin extends LightningElement {
    visibleadmin=false;
    notvisibleadmin=false;
    Currentpassword;
    Confirmpassword;
    currentpasswordchange(event){
        this.Currentpassword=event.target.value;
    }
    confirmpasswordchange(event){
        this.Confirmpassword=event.target.value;
    }

    passwordclick(){
        if(this.Currentpassword === this.Confirmpassword){
            this.visibleadmin=true;
        }
        else{
        this.notvisibleadmin=true;
    }
    
}

}
      /*render(){
        this.visibleadmin ? acc:acc2;
      }
      render(){
        this.notvisibleadmin ? acc2:acc;
      }*/