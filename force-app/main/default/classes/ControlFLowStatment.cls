public class ControlFLowStatment {
    public static Void  switchWhenMethod(){
        string todaysday = 'Tuesday';
        system.debug('today day: '+ todaysday);
        
        switch on todaysday {
            when 'Monday',  'Tuesday', 'Wednesday', 'Thursday', 'Friday'{
                system.debug('today is '+ todaysday +' go to office');
            }
            
            when 'Saturday'{
                system.debug('today is saturday go to party🎉🎉🍻🍺🍻🥂 !!');
            }
            when 'Sunday'{
                system.debug('Today is Sunday got Watch movies');
            }
        }
        
    }
    
    public static void ConditionChallenge(){
        integer year = 2004;
        
        if(Math.mod(year, 4) == 0 ){
            if(Math.mod(year, 100) == 0){
                if(Math.mod(year, 400) == 0){
                    system.debug('this is leap  year');
                }
                else{
                    system.debug('this not leap year');
                }
            }else{
                system.debug('this is leap  year');
            }
        }
        else {
            system.debug('this not leap year');
        }
        
    }
    
    public static void loopApex(){
        
       /*  for(integer year = 1100; year<=2000; Year++){
            
            if(Math.mod(year, 4) == 0 ){
                if(Math.mod(Year, 100) == 0){
                    if(Math.mod(year, 400) == 0){
                        system.debug('this is leap  year: '+year);
                    }
                    else{
                        system.debug('this not leap year: ' + year);
                    }
                }
                else{
                    system.debug('this is leap year: '+year);
                }
            }
            else {
                system.debug('this not leap year: '+year);
            }
        } */
        
        Integer year = 1100;
        do {
             if(Math.mod(year, 4) == 0 ){
                if(Math.mod(Year, 100) == 0){
                    if(Math.mod(year, 400) == 0){
                        system.debug('this is leap  year: '+year);
                    }
                    else{
                        system.debug('this not leap year: ' + year);
                    }
                }
                else{
                    system.debug('this is leap year: '+year);
                }
            }
            else {
                system.debug('this not leap year: '+year);
            }
            year++;
        }while(year <= 2000);
    }
    public static void fizzbuzzProb(){
        integer num = 0;
        do{
            if(Math.mod(num, 3) == 0 && Math.mod(num, 5) == 0){
            system.debug('FizzBuzz: '+ num);
        }else if(Math.mod(num, 3) == 0){
            system.debug('Fizz: '+ num);
        }else if(Math.mod(num, 5) == 0){
            system.debug('Buzz: '+ num);
        }
        else{
            system.debug(num);
        }
            num++;
        }
        while(num <= 100);
    }
    
    public static void fibonacciSeries(){
        integer a = 0;
        integer b = 1;
        integer sum = 0;
        integer i = 0;
        List<integer> fabonacci = new List<integer>();
        while(i<=20){
            fabonacci.add(sum);
            sum = a + b;
            a = b;
            b = sum;
            i++;
            system.debug(sum);
        }
        system.debug(fabonacci);
        
    }
    
}