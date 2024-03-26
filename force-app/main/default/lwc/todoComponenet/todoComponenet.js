import { LightningElement,track} from 'lwc';

export default class TodoComponenet extends LightningElement {
    todochange(event){
        todoinput=event.target.value
    }
      todolist=[
        {
            id:" ",
            task:this.todoinput
        },
        {
            id:" ",
            task:this.todoinput
        }
      ]
       
    eventhandler(){
 for(i=1;i<=this.todolist.length;i++){
    if(this.todolist.id=" "){
                this.todolist=
                {
                    id:" ",
                    task:this.todoinput
                }
             }
    }
}
}