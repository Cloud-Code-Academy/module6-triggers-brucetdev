// Code to illustrate casting data into different types
Integer x = 100;
System.debug('The integer value is: ' + x);
Decimal y = 100.05;
System.debug('The decimal value is: ' + y);
Integer anotherInt = (Integer)(x * y);
String myString = String.valueOf(x);
System.debug('The value of myString is: ' + myString);