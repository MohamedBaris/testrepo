public class dynamic_soql {
    
    public static void function(list<Sobject>lists,string objname){
        
        
        list<Sobject>custom_list=database.query( 'SELECT'+' '+lists+' '+ 'from' + +objname);
    }

}