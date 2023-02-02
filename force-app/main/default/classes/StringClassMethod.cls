public class StringClassMethod {
    public static void testStringClassMethod(){
        string str = 'i am a Good boy';
        string str1 = 'hello';
        string str2 = 'hellofgfghh';
        system.debug('captialize class : ' + str.capitalize());
        // compare to string
        system.debug(str1.compareTo(str2));
        //split method
        system.debug('split method: ' + str.split(' '));
        //tolowercase() and to uppercase()
        system.debug('ToLowerCase Mthod: ' + str.toLowerCase());
        system.debug('ToUpperCase Mthod: ' + str.toUpperCase());
        
        string strmatch1 = 'ranjit';
        string strmatch2 = 'RanjiT';
        // equal to method
        system.debug('is equal two string ? :  '+ strmatch1.toLowerCase().equals(strmatch2.toLowerCase()));
    }
    public static void escapecharaceterString(){
        string team = 'My team\'s  name is \'sfdc acadamy\'.' ;
        system.debug(team);
        
    }
    public static void listDataType(){
        integer[] sampleTestArray = new Integer[8];
        List<Integer> sampleTest = new List<Integer>{255357, 3342342, 4567,345678};
        //    add item in list
        sampleTest.add(77787);
        // add item on specific index
        sampletest.add(3, 66676);
        system.debug(sampleTest);
        // get item from  list by passing item index in get method.
        system.debug(sampleTest.get(3));
        // get list size;
       system.debug(SampleTest.size());
        /// update item on index 2
        sampleTest.set(2, 77777);
        system.debug(sampleTest);
        // remove item by passing index of element
        sampleTest.remove(1);
        system.debug(sampleTest);
        // clear the lis by using Clear() method;
        sampleTest.clear();
        system.debug(sampleTest); 
    }
    public static void setDatatype(){
        Set <Integer>  setElementList = new Set<integer>{3456,44567, 34567,654,567,67};
            system.debug(setElementList);
        //add element in set
        
        setELementList.add(889);
        setElementList.add(457);
        system.debug(setElementList);
        
        // adding duplicate value - NOT allowed
        setElementList.add(457);
        system.debug(setElementList);
        
        //check if set has an item,
        system.debug('item is available: '+setElementList.contains(457));
        system.debug('this item in available: '+setElementList.contains(888));
            
            
          //delete item
          setELementList.remove(457);
        system.debug('removed item  457: '+ setElementList);
        
        // get size of set
        system.debug(setElementList.size());
        
        
        // check if set is empty 
        system.debug(setElementList.isEmpty());
        // remove all item
       setElementList.clear();
        system.debug(setElementList);
        system.debug(setElementList.isempty());
    }
    public static void mapDatatype(){
        map<Integer, string> studentInfo = new map<integer, string>();
        studentInfo.put(001, 'ranjit');
        studentInfo.put(004, 'mohit');
        studentInfo.put(002, 'ranjan');
        studentInfo.put(003, 'sukhdev');
        system.debug(studentInfo);
        system.debug(studentInfo.get(001));
        
        // update or over ride th information:
        studentInfo.put(003, 'dheeru');
        system.debug(studentInfo);
        //remove an item form map
        studentInfo.remove(004);
        system.debug('004 key items  are removed: ' + studentInfo);
        
        // get a value
        system.debug('get a sigle value: '+ studentInfo.get(2));
        // get  all th keys
    //   set<Integer> rollnumb = studentInfo.keys();
        system.debug('get all keys: ' + studentInfo.keySet());
        
        
        // get all values
        List<String> studentsName = studentInfo.values();
        system.debug('get all values: '+ studentsName);
        // check if map has key
        system.debug(studentInfo.containsKey(003));
    }
    public static void testChallenge(){
        map<string, set<string>> challengeStor = new map<string, set<string>>();
        set<string> apexData = new set<string>();
        apexData.add('Demystifying Apex Collections');
        apexData.add('Datatypes and variables in apex');
        challengeStor.put('apex', apexData);
        //system.debug(challengeStor);
        
        set<string>  lightningData = new set<string>();
        lightningData.add('Evenets in aura framework');
        lightningData.add('Developing reusable componenets');
        challengeStor.put('Lightning', lightningData);
         system.debug(challengeStor);
        
    }
    public static void constantVariables(){
        Decimal Pi = 3.14;
        
        system.debug(Pi);
        Pi= 2.13;
        system.debug(pi);
        
        // if we use final keword before any variable than it's value can't be change
        final decimal c = 3.8;
        system.debug(c);
        //it cant't be override beacuse of we use  final keyword
        //c = 3.6;
       // system.debug(c);
    }
    public static void expressionAndOperator(){
        // Assignment operator
        integer x  = 5;// '=' is assignment operator
        system.debug(x);
        
        //Addition operator
        x = x+5;
        system.debug(x);
        
        //Substraction operator
        x = x-5;
        system.debug(x);
 
       //multiplication operator
       x = x*5;
        system.debug('multiplication operaotor: '+ x);
       // Division  operator
       x = x/5;
        system.debug('division operator : '+ x );
        
        // Increment Operator
        x++; //  x = x +1;
        system.debug('increment operator: '+x);
        
        // decrement operator
        x--; // x= x-1;
        system.debug('decrement operator: '+ x);
        
        //addition assignment operator
        x += 5; // x= x+5;
        system.debug('addition assignment operator: '+ x);
        
        //substraction assisgnment operator
        x -=  5; // x = x-5;
        system.debug('sustraction assignment operator: '+ x);
        
        //multiplication assignment oooperator
        x *= 5;
        system.debug('multiplication assignment operator: '+ x);
        
        //Division Assignment Operator
        
        x /= 5;
        system.debug('division assignment operator: '+ x);
        
        // boolean operator
        Boolean first = true;
        boolean second = false;
        boolean result;
        // AND Operator
        result = first && second;// both are true then return true and if anyone of them false then return false;
        system.debug('and operator: '+result);
        
        // eqaulity operator
         result = (first == second);// if both expression  have the same value,then true else false return;
        system.debug('euality oeprator: '+ result);
        
        
        //ternary operator
        string greeting = '';
        integer hour = 13;
        greeting = (hour < 12)? 'Good Morning😊😊' : ' Good Night✨✨';
        system.debug('Ternary Condition: '+ greeting);
    }
    public static void  challengeTwo(){
      final  integer oneSlice = 8;
       final integer  twothreeslice = 7;
       final integer morethreeSlice = 6; 
        
        integer rossOrder = 3;
        integer chandOrder = 1;
        integer joeyorder = 4;
        
        integer rosserPayment = (rossOrder == 1) ? oneSlice* rossOrder : (rossOrder >= 2 && rossOrder < = 3) ? rossOrder* twothreeslice : rossOrder * morethreeSlice;
        integer chandOrderPayement = (chandOrder == 1) ? chandOrder* oneSlice : (chandOrder >=2 && chandOrder <=3) ? chandOrder*twothreeslice : rossOrder * morethreeSlice;
        integer joeyOrderPayement = (joeyorder == 1) ? joeyorder* oneSlice : (joeyorder >=2 && joeyorder <=3) ? joeyorder*twothreeslice : joeyorder * morethreeSlice;
        
        system.debug('roser order payement is : '+ rosserPayment);
        system.debug('chandler order payment is : '+ chandOrderPayement);
        system.debug('joey order payment is : '+ joeyOrderPayement);
        
    }
}