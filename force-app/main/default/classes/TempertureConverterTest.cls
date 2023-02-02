@isTest
private class TempertureConverterTest {
    @isTest static void testWarmtemp(){
        Decimal celsius = TempertureConverter.FahrenheitToCelsius(70);
        system.assertEquals(21.11, celsius);
    }
    
    @isTest static void testFreezingPoint(){
        Decimal celsius = TempertureConverter.FahrenheitToCelsius(32);
        system.assertEquals(0, celsius);
    }
    
    @isTest Static void testBoilingPoint(){
         Decimal celsius = TempertureConverter.FahrenheitToCelsius(212);
         System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    }
       
    @isTest static void testNegativeTemp() {
        Decimal celsius = TempertureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33,celsius);
    }
}