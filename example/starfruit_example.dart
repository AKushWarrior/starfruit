import 'package:starfruit/starfruit.dart';
import 'dart:core';

void main () {
  //Begin math functions

  //Round to 2 decimal places
  //Ceiling and flooring to decimal places is also available
  print('Round 3.5634 to 2 decimal places:');
  print(mathUtils.roundToDouble(3.5634, 2));
  print('');

  //Power of two check
  print('Is 8 a power of two?');
  print(mathUtils.isPowerOfTwo(8));
  print('');

  //Calculate log base 2 of 8
  print('Calculate log base 2 of 8:');
  print(mathUtils.logBase(2, 8));
  print('');

  //double isInteger check
  print('Is 6.0 an integer?');
  print(mathUtils.isMathematicalInteger(6.0));
  print('');

  //Calculate 5!
  print('Calculate 5 factorial:');
  print(mathUtils.factorial(5));
  print('');

  //Check if 2 is within 3 of 5
  print('Is 2 within 3 of 5?');
  print(mathUtils.fuzzyEquals(2, 5, 3));
  print('');

  //Check if 7919 is a prime number
  print('Is 7919 prime?');
  print(mathUtils.isPrime(7919));
  print('');

  //LCM of 2 and 7
  print('Calculate LCM of 2 and 7:');
  print(mathUtils.lcm(2, 7));
  print('');

  //sinh of 1 radian
  print('Calculate sinh of 1 radian:');
  print(mathUtils.sinh(1));
  print('');

  //mean of 3 and 7
  print('Calculate mean of 3 and 7:');
  print(mathUtils.mean(3,7));
  print('');

  //nCr where n = 5 and r = 2
  print('Calculate the binomial coefficient of 2 and 5:');
  print(mathUtils.combinationsOf(5, 2));
  print('');

  //nPr where n = 5 and r = 2
  print('Calculate the permutations of 2 and 5:');
  print(mathUtils.permutationsOf(5, 2));
  print('');

  //end math functions

  //start collection functions

  //Separate List into chunks
  print('Separate List into chunks of 4:');
  print(collectionUtils.chunks([1,2,3,4,5,6,7,8], 4));
  print('');

  //Collapse List<List<Object>> into just List<Object>
  print('Collapse List<List> into List:');
  print(collectionUtils.collapse( [[1,2,3],[4,5,6,7,8]] ));
  print('');

  //Get every nth object of list
  print('Get every 4th object:');
  print(collectionUtils.nth([1,2,3,4,5,6,7,8], 4));
  print('');

  //Get every n random elements of list
  print('Get 5 random elements:');
  print(collectionUtils.random([1,2,3,4,5,6,7,8], 5));
  print('');

  //Flip keys and values of a map
  print('Flip keys and values of a map:');
  print(collectionUtils.flip({1:0, 2:8, 3:4, 0:5}));
  print('');

  //Zip two Lists into a map
  print('Zip two lists into a map:');
  print(collectionUtils.zip([1,2,3,4], [5,6,7,8]));
  print('');

  //Unzip a map into two lists
  print('Unzip a map into two lists:');
  print(collectionUtils.unzip({0:1, 8:2, 4:3, 5:0}));
  print('');

  //end collection functions

  //start stats functions
  var stats = [1,3,4,5,12,3,4,67,8,0,22];

  //median
  print('Calculate the median:');
  print(stats.median);
  print('');

  //mean
  print('Calculate the mean:');
  print(stats.mean);
  print('');

  //mode
  print('Calculate the mode:');
  print(stats.mode);
  print('');

  //variance
  print('Calculate the variance:');
  print(stats.variance);
  print('');

  //standard deviation
  print('Calculate the standard deviation:');
  print(stats.stdDev);
  print('');

  //cardinality; number of unique elements
  print('Calculate the cardinality:');
  print(stats.cardinality);
  print('');

  //7 greatest elements
  print('Return the 7 greatest elements:');
  print(stats.topElements(7));
  print('');

  //end stats functions

  //start xy stats functions

  var xystats = {2:3, 7:4, 4:6, 8:9, 1:2, 3:5, 11:14, 12:18};

  //Get correlation coefficient
  print('Calculate correlation coefficient:');
  print(xystats.corCoefficient);
  print('');

  //Get determination coefficent
  print('Calculate determination coefficient:');
  print(xystats.detCoefficient);
  print('');

  //Get adjusted determination coefficient
  print('Calculate adj. determination coefficient:');
  print(xystats.adjDetCoefficient);
  print('');

  //Get linear regression line
  print('Calculate linear regression line in form y = mx + b:');
  var lr = xystats.linReg;
  print('y = ${lr[0]}x + ${lr[1]}');
  print('');

  //Get quadratic regression line
  print('Calculate quadratic regression line in form y = ax^2 + bx + c:');
  var qdr = xystats.quadReg;
  print('y = ${qdr[0]}x^2 + ${qdr[1]}x + ${qdr[2]}');
  print('');

  //Get cubic regression line
  print('Calculate cubic regression line in form y = ax^3 + bx^2 + cx + d:');
  var cr = xystats.cubicReg;
  print('y = ${cr[0]}x^3 + ${cr[1]}x^2 + ${cr[2]}x + ${cr[3]}');
  print('');

  //Get quartic regression line
  print('Calculate quartic regression line in form y = ax^4 + bx^3 + cx^2 + dx + e:');
  var qrr = xystats.quarReg;
  print('y = ${qrr[0]}x^4 + ${qrr[1]}x^3 + ${qrr[2]}x^2 + ${qrr[3]}x + ${qrr[4]}');
  print('');
  // end xy stats functions
}