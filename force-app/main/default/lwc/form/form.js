import { LightningElement } from 'lwc';

export default class Form extends LightningElement {
    employee=[
        {
            id:101,
            Name:'john',
            salary:4000
        },
        {
            id:102,
            Name:'vino',
            salary:6000
        },
        {
            id:103,
            Name:'hanif',
            salary:8000
        }
    ]
    handleSelect(event){
       const empno=Event.target.dataset.empno;
       const empname=Event.target.dataset.empname;
       alert (`code=${empno} and name=${empname}`)
       
    } 
    handleclear(){
        const empno=Event.target.dataset.empno;
        this.template.querySelector(`lightning-input[data-empno='${empno}']`).value="";
         };
         handleClearAll(){
          Array.from(this.template.querySelectorAll("lightning-input")).forEach(e=>e.value="");
         }
         handleclearfirst(){
          this.template.querySelector("lightning-input[data-empno='101']").value="";
         }
    }