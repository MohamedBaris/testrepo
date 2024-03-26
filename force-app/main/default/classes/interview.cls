public class interview {

    public static void function(integer a){
    Integer i,j;
    String pattern='';
        for(i=1;i<a;++i){	
           for(j = 1; j <= i; ++j){
               pattern+=j; 
       	    }
     	pattern+='\n';       
     	}
        System.debug('Pattern \n'+pattern);
}
}