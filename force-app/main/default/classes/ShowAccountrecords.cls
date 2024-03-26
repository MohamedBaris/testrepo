public class ShowAccountrecords {

 
         public static void function(){
             list<integer> int_list=new list<integer>{1,2,3,4};
             system.debug(int_list);
             string find=json.serialize(int_list);
             system.debug(find);
         }
}