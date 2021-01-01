# Starfruit

A library containing useful utilities, efficiencies, and 
abstractions to improve over the Dart SDK and dart:math. It takes heavy 
inspiration from Guava (by Google) for Java, and ports some functions from 
it. 

---

It takes time, effort, and mental power to keep this package updated, useful, and
improving. If you used or are using the package, I'd appreciate it if you could spare a few 
dollars to help me continue to do so.

[![PayPal](https://img.shields.io/static/v1?label=PayPal&message=Donate&color=blue&logo=paypal&style=for-the-badge&labelColor=black)](https://www.paypal.me/kishoredev)

---

## Classes

Note: https://pub.dev/documentation/starfruit/latest/starfruit/starfruit-library.html 
is auto-generated dartdocs. This has a more detailed rundown of every class
and method. It's impossible to list every method offered and its purpose, 
so I won't try. You **should** use the usage examples and documentation to understand
the utilities of this library. For here, I'm just offering basic details on how to 
instantiate every class.

##### StarMathUtils (mathUtils)
To use, call methods on the singleton instance mathUtils (e.g. `mathUtils.chunks([1, 2, 3, 4, 5, 6], 2)` ).

##### StarCollectionUtils (collectionUtils)
To use, call methods on the singleton instance collectionUtils (e.g. `collectionUtils.chunks([1, 2, 3, 4, 5, 6], 2)` ).

##### StarStats (`List<num>`)
To use, collect a list of numerical input data.

##### StarStatsXY (```Map<num,num>``` of points)
To use, collect input data formatted {x1: y1, x2: y2, x3: y3, ...}. You can then call StarStatsXY methods
on it, because StarStatsXY is defined as an extension on Map<num, num>.

---

## Usage Examples

##### Math Utilities:

```dart
import 'package:starfruit/starfruit.dart';

main() {
  /Round to 2 decimal places
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
  print(mathUtils.log(2, 8));
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
  print('Calculate the permutations of 5 and 2:');
  print(mathUtils.permutationsOf(5, 2));
  print('');
}
```
##### Collection Utilities:
```dart
import 'package:starfruit/starfruit.dart';

main() {
  //Separate List into chunks
  print("Separate List into chunks of 4:");
  print(cUtils.chunks([1,2,3,4,5,6,7,8], 4));
  print("");

  //Collapse List<List<Object>> into just List<Object>
  print("Collapse List<List> into List:");
  print(cUtils.collapse( [[1,2,3],[4,5,6,7,8]] ));
  print("");

  //Get every nth object of list
  print("Get every 4th object:");
  print(cUtils.nth([1,2,3,4,5,6,7,8], 4));
  print("");

  //Get every n random elements of list
  print("Get 5 random elements:");
  print(cUtils.random([1,2,3,4,5,6,7,8], 5));
  print("");

  //Flip keys and values of a map
  print("Flip keys and values of a map:");
  print(cUtils.flip({1:0, 2:8, 3:4, 0:5}));
  print("");

  //Zip two Lists into a map
  print("Zip two lists into a map:");
  print(cUtils.zip([1,2,3,4], [5,6,7,8]));
  print("");

  //Unzip a map into two lists
  print("Unzip a map into two lists:");
  print(cUtils.unzip({0:1, 8:2, 4:3, 5:0}));
  print("");
}
```

##### Stats Utilities:

```dart
import 'package:starfruit/starfruit.dart';

main() {
  var stats = [1,3,4,5,12,3,4,67,8,0,22];

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
}
```
##### XY (Paired) Stats Utilities:

```dart
import 'package:starfruit/starfruit.dart';

main() {
  var xystats = {2:3, 7:4, 4:6, 8:9, 1:2, 3:5, 11:14, 12:18};

  //Get correlation coefficient
  print("Calculate correlation coefficient:");
  print(xystats.corCoefficient);
  print("");

  //Get determination coefficent
  print("Calculate determination coefficient:");
  print(xystats.detCoefficient);
  print("");

  //Get adjusted determination coefficient
  print("Calculate adj. determination coefficient:");
  print(xystats.adjDetCoefficient);
  print("");

  //Get linear regression line
  print("Calculate linear regression line in form y = mx + b:");
  var lr = xystats.linReg;
  print("y = ${lr[0]}x + ${lr[1]}");
  print("");

  //Get quadratic regression line
  print("Calculate quadratic regression line in form y = ax^2 + bx + c:");
  var qdr = xystats.quadReg;
  print("y = ${qdr[0]}x^2 + ${qdr[1]}x + ${qdr[2]}");
  print("");

  //Get cubic regression line
  print("Calculate cubic regression line in form y = ax^3 + bx^2 + cx + d:");
  var cr = xystats.cubicReg;
  print("y = ${cr[0]}x^3 + ${cr[1]}x^2 + ${cr[2]}x + ${cr[3]}");
  print("");

  //Get quartic regression line
  print("Calculate quartic regression line in form y = ax^4 + bx^3 + cx^2 + dx + e:");
  var qrr = xystats.quarReg;
  print("y = ${qrr[0]}x^4 + ${qrr[1]}x^3 + ${qrr[2]}x^2 + ${qrr[3]}x + ${qrr[4]}");
  print("");
}
```

---

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/AKushWarrior/starfruit/issues

---

[![Pub](https://img.shields.io/pub/v/starfruit?color=blue&label=pub&logo=Steel%20Crypt&logoColor=blue&style=for-the-badge&labelColor=black)](https://pub.dev/packages/starfruit)
[![License](https://img.shields.io/github/license/AKushWarrior/starfruit?color=blue&style=for-the-badge&labelColor=black)](https://opensource.org/licenses/lgpl-3.0.html)
[![Commits](https://img.shields.io/github/commit-activity/m/AKushWarrior/starfruit?color=blue&style=for-the-badge&labelColor=black)](https://github.com/AKushWarrior/starfruit)


###### Starfruit, a set of Dart utility libraries.
###### ©2020 Aditya Kishore
###### Licensed under the MPL 2.0 (See LICENSE)
