trigger futuretriggre on Contact (after insert) {

     
    string find=json.serialize(trigger.new);
    
   futureclass.numberofcon(find);
     
}