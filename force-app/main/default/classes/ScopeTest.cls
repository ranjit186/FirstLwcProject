public class ScopeTest {
    static string nameOfStudents = 'Ranjit';
    public static string normalScope(){
        nameOfStudents = 'Kumar';
        system.debug(nameOfStudents);
        return nameOfStudents;
    }
    public static void anotherMethod(){
        system.debug(nameOfStudents);
    }
    public ScopeTest(){
        system.debug('first constructor');    
    }
    public ScopeTest(string name){
        system.debug('My Name is ' + name);
    }
    public ScopeTest(string name, integer age){
        this('Atul\'s');
        system.debug(age + 'constructor');
    }
}