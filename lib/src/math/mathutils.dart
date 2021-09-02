/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2020 Aditya Kishore

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
*/

import 'dart:math';
import 'dart:math' as math;

///Default implementation of StarMathUtils().
_StarMathUtils get mathUtils => _StarMathUtils();

///A class of packaged math utilities and various commonplace functions not
///provided by (or improving upon) Dart functions. They can be used the default
///construction of StarMathUtils, mUtils.
class _StarMathUtils {
  ///Round to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx).
  ///
  /// Note that, due to floating point errors, this method doesn't work past
  /// ~14 decimal places.
  num roundToDouble(num input, int decPlaces) {
    for (int i = 0; i < decPlaces; i++) {
      input *= 10;
    }
    input += 0.00000000000001;
    input = input.round();
    return input / pow(10, decPlaces);
  }

  ///Round up (ceil) to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx).
  double ceilToDouble(num input, int decPlaces) {
    var fac = pow(10, decPlaces);
    input = (input * fac).ceil() / fac;
    return input.toDouble();
  }

  ///Round down (floor) to a double place where the second input corresponds to the amount
  ///of decimal places in the first double (eg 1 ==> x.x, 2 ==> x.xx, 3 ==> x.xxx).
  double floorToDouble(num input, int decPlaces) {
    var fac = pow(10, decPlaces);
    input = (input * fac).floor() / fac;
    return input.toDouble();
  }

  ///Returns whether given ```input``` is a perfect power of two.
  bool isPowerOfTwo(num input) {
    if (input <= 0) {
      return false;
    }
    return isMathematicalInteger(logBase(2, input));
  }

  ///Returns whether given ```input``` is a perfect power of `n`.
  bool isPowerOfN(num input, num n) {
    if (input < 0 && n > 0) {
      return false;
    } else if ((input == 0) | (n == 0)) {
      return false;
    } else if (input > 0 && n > 0) {
      return isMathematicalInteger(logBase(n, input));
    } else if (input < 0 && n < 0) {
      return logBase(-n, -input) % 2 == 1;
    } else {
      return logBase(-n, input) % 2 == 0;
    }
  }

  ///Returns log given ```base``` and ```input```.
  double logBase(num base, num input) {
    return math.log(input) / math.log(base);
  }

  ///Returns whether given double is a mathematical integer (e.x. 6.0).
  bool isMathematicalInteger(num input) {
    return input % 1 == 0.0;
  }

  ///Returns factorial given integer ```input```.
  int factorial(int input) {
    if (input < 0) {
      throw ArgumentError(
          'factorial($input) is undefined for negative arguments.');
    }
    if (input < factorials.length) {
      return factorials[input];
    }
    var r = factorials.last;
    for (var i = factorials.length; i <= input; i++) {
      r *= i;
      factorials.add(r);
    }
    return r;
  }

  /// A list of provided factorials, where ```factorials[i] == i!```
  ///
  /// This list has every factorial less than 2^64 (20! and under). The
  /// `factorial` method wraps this in some safety; it throws on negative
  /// numbers with an explanation, and multiplies to attempt to calculate
  /// factorials higher than 20!. The Dart language does not currently natively
  /// support 64+ bit integers, but if that happens in the future, the factorial
  /// method should still work.
  static List<int> factorials = [
    1,
    1,
    2,
    6,
    24,
    120,
    720,
    5040,
    40320,
    362880,
    3628800,
    39916800,
    479001600,
    6227020800,
    87178291200,
    1307674368000,
    20922789888000,
    355687428096000,
    6402373705728000,
    121645100408832000,
    2432902008176640000,
  ];

  ///Returns true if ```x``` is within some tolerance of ```y```
  ///
  ///Ex. 1: fuzzyEquals(1, 4, 3) returns true
  ///
  ///Ex. 2: fuzzyEquals(1, 6, 3) returns false
  ///
  ///Tolerance must be positive
  bool fuzzyEquals(num x, num y, num tolerance) {
    if (tolerance < 0) {
      throw ArgumentError('Tolerance must be >= 0');
    }
    var xL = x + tolerance;
    var xS = x - tolerance;
    return xL >= y && y >= xS;
  }

  ///Tests if the number `n` is (probably) a prime.
  ///
  ///This variant of the probabilistic prime test by Miller–Rabin is deterministic.
  ///
  ///It has been verified to return correct results for all `n` < 341,550,071,728,321.
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

  ///Returns least common multiple of inputs.
  int lcm(int x, int y) => x * y ~/ x.gcd(y);

  ///Computes hyperbolic arc-cosine of a number.
  double acosh(num x) => math.log(x + math.sqrt(x * x - 1));

  ///Computes hyperbolic arc-sine of a number.
  double asinh(num x) => x.isInfinite && x.isNegative
      ? x.toDouble()
      : math.log(x + math.sqrt(x * x + 1));

  ///Computes hyperbolic arc-tangent of a number.
  double atanh(num x) => math.log((1 + x) / (1 - x)) / 2;

  ///Computes hyperbolic cosine of a number.
  double cosh(num x) {
    final y = math.exp(x);
    return (y + 1 / y) / 2;
  }

  ///Computes hyperbolic sine of a number.
  double sinh(num x) {
    final y = math.exp(x);
    return (y - 1 / y) / 2;
  }

  ///Computes hyperbolic tangent of a number.
  double tanh(num x) {
    final a = math.exp(x), b = math.exp(-x);
    return a.isInfinite
        ? 1
        : b.isInfinite
            ? -1
            : (a - b) / (a + b);
  }

  /// Best method for computing the arithmetic mean.
  ///
  /// The alternative ```(x + y) / 2``` fails for large values, which this handles.
  int mean(int x, int y) {
    return (x & y) + ((x ^ y) >> 1);
  }

  ///Combinations function from probability, nCr.
  ///
  ///Also described as the binomial coefficient.
  int combinationsOf(int n, int r) {
    return (factorial(n) / (factorial(n - r) * factorial(r))).round();
  }

  ///Permutations function from probability, nPr.
  int permutationsOf(int n, int r) {
    return (factorial(n) / factorial(n - r)).round();
  }

  /// Compute the signum of a number.
  /// The signum is -1 for negative numbers, +1 for positive numbers and 0 otherwise.
  num signum(num a) {
    return (a < 0.0) ? -1.0 : ((a > 0.0) ? 1.0 : a);
  }
}
