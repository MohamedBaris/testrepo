import { LightningElement} from 'lwc';

export default class Employee extends LightningElement {
      salary;
       arr=[];
    salarychange(event){
     this.salary=parseInt(event.target.value);
    }
    Employees=[
        {
            name:'vino',
            position:'sales_Manager',
            salary:40000
        },
        {
            name:'hanif',
            position:'marketing_Manager',
            salary:30000
        },
        {
        name:'hanif',
        position:'sales_rep',
        salary:20000
        }
    ]
    eventhandler(){ 
         
        this.arr=this.Employees.filter((value)=>value.salary > this.salary)
    }
    clearhandler(){
        this.arr.name=" ";
        this.arr.position=" ";
        this.arr.salary=" ";
    }
}