/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2019 Aditya Kishore

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
*/

import 'dart:math';

import 'dart:math' as math;

StarMathUtils get mUtils => StarMathUtils();

///A class of packaged math utilities and various commonplace functions not
///provided by (or improving upon) Dart functions. They can be used the default
///construction of StarMathUtils, mUtils.
class StarMathUtils {

  ///round to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx)
  ///decPlaces must be >= 0
  double roundToDouble(double input, int decPlaces) {
    double parsedInp = 1.0;
    int fac = pow(10, decPlaces);
    parsedInp = parsedInp / fac;
    if ((input % 1).toString().length - 2 < decPlaces) {
      throw ArgumentError(
          "Invalid length for input: Already less than given decPlaces");
    } else {
      input = (input * fac).round() / fac;
      return input;
    }
  }

  ///round up (ceil) to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx)
  ///decPlaces must be >= 0
  double ceilToDouble(double input, int decPlaces) {
    double parsedInp = 1.0;
    int fac = pow(10, decPlaces);
    parsedInp = parsedInp / fac;
    if ((input % 1).toString().length - 2 < decPlaces) {
      throw ArgumentError(
          "Invalid length for input: Already less than given decPlaces");
    } else {
      input = (input * fac).ceil() / fac;
      return input;
    }
  }

  ///round down (floor) to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx)
  ///decPlaces must be >= 0
  double floorToDouble(double input, int decPlaces) {
    double parsedInp = 1.0;
    int fac = pow(10, decPlaces);
    parsedInp = parsedInp / fac;
    if ((input % 1).toString().length - 2 < decPlaces) {
      throw ArgumentError(
          "Invalid length for input: Already less than given decPlaces");
    } else {
      input = (input * fac).floor() / fac;
      return input;
    }
  }

  ///returns whether given input is a power of two
  bool isPowerOfTwo(num input) {
    return log(2, input).ceil() == log(2, input).floor();
  }

  ///returns log given base and input
  double log(num base, num input) {
    return math.log(input) / math.log(base);
  }

  ///returns whether given double is a mathematical integer (e.x. 6.0)
  bool isMathematicalInteger(double input) {
    return input % 1 == 0.0;
  }

  ///returns factorial given integer input
  int factorial(int input) {
    if (input < 0) {
      throw ArgumentError('factorial($input) is undefined for negative arguments.');
    }
    if (input < factorials.length) {
      return factorials[input];
    }
    var r = factorials.last;
    for (var i = factorials.length; i <= input; i++) {
      r *= i;
    }
    return r;
  }

  ///A list of provided factorials, where factorials[i] == i!
  ///This list will grow the more you use the provided factorial class with values > 11
  static List<int> factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600, 6227020800, 87178291200];

  ///Returns true if x is within some tolerance of y
  ///Ex. 1: fuzzyEquals(1, 4, 3) returns true
  ///Ex. 2: fuzzyEquals(1, 6, 3) returns false
  ///Tolerance must be positive
  bool fuzzyEquals (num x, num y, num tolerance) {
    if (tolerance < 0) {
      throw ArgumentError("Tolerance must be >= 0");
    }
    num xL = x + tolerance;
    num xS = x - tolerance;
    return xL >= y && y >= xS;
  }



  ///Tests if the number n is probably a prime.
  ///This variant of the probabilistic prime test by Miller–Rabin is deterministic.
  ///It has been verified to return correct results for all n < 341,550,071,728,321.
  bool isPrime(int n) {
    if (n == 2 || n == 3 || n == 5) {
      return true;
    }
    if (n < 2 || n % 2 == 0 || n % 3 == 0 || n % 5 == 0) {
      return false;
    }
    if (n < 25) {
      return true;
    }
    var d = n - 1, s = 0;
    while (d % 2 == 0) {
      d ~/= 2;
      s++;
    }
    loop:
    for (final a in [2, 3, 5, 7, 11, 13, 17]) {
      var x = a.modPow(d, n);
      if (x == 1 || x == n - 1) {
        continue loop;
      }
      for (var r = 0; r <= s - 1; r++) {
        x = x.modPow(2, n);
        if (x == 1) {
          return false;
        }
        if (x == n - 1) {
          continue loop;
        }
      }
      return false;
    }
    return true;
  }

  ///returns least common multiple of inputs
  int lcm(int x, int y) => x * y ~/ x.gcd(y);

  ///computes hyperbolic arc-cosine of a number
  double acosh(num x) => math.log(x + math.sqrt(x * x - 1));

  ///computes hyperbolic arc-sine of a number
  double asinh(num x) => x.isInfinite && x.isNegative ? x : math.log(x + math.sqrt(x * x + 1));

  ///computes hyperbolic arc-tangent of a number
  double atanh(num x) => math.log((1 + x) / (1 - x)) / 2;

  ///computes hyperbolic cosine of a number
  double cosh(num x) {
    final y = math.exp(x);
    return (y + 1 / y) / 2;
  }

  ///computes hyperbolic sine of a number
  double sinh(num x) {
    final y = math.exp(x);
    return (y - 1 / y) / 2;
  }

  ///computes hyperbolic tangent of a number
  double tanh(num x) {
    final a = math.exp(x), b = math.exp(-x);
    return a.isInfinite ? 1 : b.isInfinite ? -1 : (a - b) / (a + b);
  }

  /// Best method for computing the arithmetic mean.
  /// The alternative (x + y) / 2 fails for large values, which this handles.
  int mean(int x, int y) {
    return (x & y) + ((x ^ y) >> 1);
  }

  ///Combinations function from probability, nCr
  ///Also described as the binomial coefficient
  int combinationsOf(int n, int r) {
    return ( factorial(r) / (factorial(r-n) * factorial(n) ) ).round();
  }

  ///Permutations function from probability, nPr
  int permutationsOf(int n, int r) {
    return (factorial(r)/factorial(r-n)).round();
  }

}
