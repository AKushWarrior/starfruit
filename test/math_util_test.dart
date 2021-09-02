import 'package:test/test.dart';
import 'package:starfruit/starfruit.dart';

void main() {
  group('roundToDouble should round to the specified number of places:', () {
    test('two places rounding up', () {
      var rounded = mathUtils.roundToDouble(1.005, 2);
      expect(rounded, equals(1.01));
    });
    test('two places rounding down', () {
      var rounded = mathUtils.roundToDouble(1.013, 2);
      expect(rounded, equals(1.01));
    });
    test('negative two places rounding down', () {
      var rounded = mathUtils.roundToDouble(-1.014, 2);
      expect(rounded, equals(-1.01));
    });
  });

  test('ceilToDouble should ceil to the specified number of places', () {
    var rounded = mathUtils.ceilToDouble(1.002, 2);
    expect(rounded, equals(1.01));
  });

  test('floorToDouble should floor to the specified number of places', () {
    var rounded = mathUtils.floorToDouble(1.017, 2);
    expect(rounded, equals(1.01));
  });

  group('isPowerOfTwo should return true for all powers of two:', () {
    test('non-power of two (34)', () {
      expect(mathUtils.isPowerOfTwo(34), equals(false));
    });
    test('non-power of two (-2)', () {
      expect(mathUtils.isPowerOfTwo(-2), equals(false));
    });
    test('power of two (8)', () {
      expect(mathUtils.isPowerOfTwo(8), equals(true));
    });
    test('power of two (0.25)', () {
      expect(mathUtils.isPowerOfTwo(0.25), equals(true));
    });
  });

  group('isPowerOfN should return true for all powers of N:', () {
    test('non-power of three (34, 3)', () {
      expect(mathUtils.isPowerOfN(34, 3), equals(false));
    });
    test('power of four (16, 4)', () {
      expect(mathUtils.isPowerOfN(16, 4), equals(true));
    });
    test('power of negative 2 (-8, -2)', () {
      expect(mathUtils.isPowerOfN(-8, -2), equals(true));
    });
    test('power of negative 3 (9, -3)', () {
      expect(mathUtils.isPowerOfN(9, -3), equals(true));
    });
  });

  test('logBase should return what exponent of the base the input is', () {
    expect(mathUtils.logBase(2, 8), equals(3));
  });

  test('isMathematicalInteger should return true if input is divisible by 1',
      () {
    expect(mathUtils.isMathematicalInteger(3.0), equals(true));
  });

  group('factorial should return the factorial of the input:', () {
    test('factorial 5', () {
      var fac5 = mathUtils.factorial(5);
      expect(fac5, equals(120));
    });

    test('factorial 13', () {
      var fac13 = mathUtils.factorial(13);
      expect(fac13, equals(6227020800));
    });
  });

  group('fuzzy equals should return whether the two numbers are within a range of each other:', () {
    test('6 and 4, range 2', () {
      var base = mathUtils.fuzzyEquals(6, 4, 2);
      expect(base, equals(true));
    });

    test('4 and 6, range 2', () {
      var base = mathUtils.fuzzyEquals(4, 6, 2);
      expect(base, equals(true));
    });

    test('7 and 11, range 3', () {
      var base = mathUtils.fuzzyEquals(7, 11, 3);
      expect(base, equals(false));
    });

    test('11 and 7, range 3', () {
      var base = mathUtils.fuzzyEquals(11, 7, 3);
      expect(base, equals(false));
    });
  });

  group('isPrime checks if number is a prime:', () {
    test('1', () {
      expect(mathUtils.isPrime(1), equals(false));
    });
    test('0', () {
      expect(mathUtils.isPrime(0), equals(false));
    });
    test('7907', () {
      expect(mathUtils.isPrime(7907), equals(true));
    });
    test('2', () {
      expect(mathUtils.isPrime(2), equals(true));
    });
  });
}
