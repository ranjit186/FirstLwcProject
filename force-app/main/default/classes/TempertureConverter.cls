public class TempertureConverter {
    public static Decimal FahrenheitToCelsius(Decimal Fh){
        decimal cs = (Fh - 32) * 5/9;
        return cs.setScale(2);
    }
}