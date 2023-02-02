public class CalculatorTest {
    public static decimal CalculatorBMI( decimal weight, decimal height){
        decimal BMI = (weight)/(height*height);
        system.debug(BMI);
        return BMI;
    }
    public static decimal CalculatorPace( decimal distance, decimal minutes){
        decimal hour = minutes/60;
        system.debug('minutes convert into hour changes by ranjit' + hour);
        decimal Pace = (distance)/(hour);
        system.debug(Pace);
        return Pace;
    }
}