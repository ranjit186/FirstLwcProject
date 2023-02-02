public with sharing class PassParameterActionFunction {
    public String val{get;set;}
    public string enteredText1{get;set;}
    public String enteredText2{get;set;}

    public void echoVal()
    {
        system.debug('enteredText1 :' + enteredText1);
     val = 'You have entered : 1 - '+enteredText1+' 2 -'+enteredText2;
    }
}