import 'package:starfruit/starfruit.dart';
import 'dart:core';

main () {
  //Begin math functions

  //Round to 2 decimal places
  //Ceiling and flooring to decimal places is also available
  print("Round 3.5634 to 2 decimal places:");
  print(mUtils.roundToDouble(3.5634, 2));
  print("");

  //Power of two check
  print("Is 8 a power of two?");
  print(mUtils.isPowerOfTwo(8));
  print("");

  //Calculate log base 2 of 8
  print("Calculate log base 2 of 8:");
  print(mUtils.log(2, 8));
  print("");

  //double isInteger check
  print("Is 6.0 an integer?");
  print(mUtils.isMathematicalInteger(6.0));
  print("");

  //Calculate 5!
  print("Calculate 5 factorial:");
  print(mUtils.factorial(5));
  print("");

  //Check if 2 is within 3 of 5
  print("Is 2 within 3 of 5?");
  print(mUtils.fuzzyEquals(2, 5, 3));
  print("");

  //Check if 7919 is a prime number
  print("Is 7919 prime?");
  print(mUtils.isPrime(7919));
  print("");

  //LCM of 2 and 7
  print("Calculate LCM of 2 and 7:");
  print(mUtils.lcm(2, 7));
  print("");

  //sinh of 1 radian
  print("Calculate sinh of 1 radian:");
  print(mUtils.sinh(1));
  print("");

  //mean of 3 and 7
  print("Calculate mean of 3 and 7:");
  print(mUtils.mean(3,7));
  print("");

  //nCr where n = 2 and r = 5
  print("Calculate the binomial coefficient of 2 and 5:");
  print(mUtils.combinationsOf(2, 5));
  print("");

  //nPr where n = 2 and r = 5
  print("Calculate the permutations of 2 and 5:");
  print(mUtils.permutationsOf(2, 5));
  print("");

  //end math functions

  //start stats functions
  var stats = StarStats([1,3,4,5,12,3,4,67,8,0,22]);

  //median
  print("Calculate the median:");
  print(stats.median);
  print("");

  //mean
  print("Calculate the mean:");
  print(stats.mean);
  print("");

  //mode
  print("Calculate the mode:");
  print(stats.mode);
  print("");

  //variance
  print('Calculate the variance:');
  print(stats.variance);
  print("");

  //standard deviation
  print("Calculate the standard deviation:");
  print(stats.stdDev);
  print("");

  //cardinality; number of unique elements
  print("Calculate the cardinality:");
  print(stats.cardinality);
  print("");

  //7 greatest elements
  print("Return the 7 greatest elements:");
  print(stats.topElements(7));
  print("");

  //end stats functions

  //start xy stats functions

  var xystats = StarStatsXY({2:3, 7:4, 4:6, 8:9, 1:2, 3:5, 11:14, 12:18});

  //Get correlation coefficient
  print("Calculate correlation coefficient:");
  print(xystats.corCoefficient);
  print("");

  //Get linear regression line
  print("Calculate linear regression line in form y = mx + b:");
  var lr = xystats.linReg;
  print("y = ${lr[0]}x + ${lr[1]}");
  print("");

  //Get adjusted determination coefficient for linear regression line
  print("Calculate adj. determination coefficient for linear regression:");
  print(xystats.detCoefficient(1));
  print("");

  // end xy stats functions
}