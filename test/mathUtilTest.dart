import 'package:test/test.dart';
import 'package:should/should.dart';
import 'package:starfruit/starfruit.dart';

void main() {
  should.errorOnAssert = true;

  group('roundToDouble should round to the specified number of places:', () {
    test('two places rounding up', () {
      var rounded = mathUtils.roundToDouble(1.005, 2);
      requireThat(rounded).equal(1.01);
    });
    test('two places rounding down', () {
      var rounded = mathUtils.roundToDouble(1.013, 2);
      requireThat(rounded).equal(1.01);
    });
    test('negative two places rounding down', () {
      var rounded = mathUtils.roundToDouble(-1.014, 2);
      requireThat(rounded).equal(-1.01);
    });
  });

  test('ceilToDouble should ceil to the specified number of places', () {
    var rounded = mathUtils.ceilToDouble(1.002, 2);
    requireThat(rounded).equal(1.01);
  });

  test('floorToDouble should floor to the specified number of places', () {
    var rounded = mathUtils.floorToDouble(1.017, 2);
    requireThat(rounded).equal(1.01);
  });

  group('isPowerOfTwo should return true for all powers of two:', () {
    test('non-power of two (34)', () {
      requireThat(mathUtils.isPowerOfTwo(34)).equal(false);
    });
    test('non-power of two (-2)', () {
      requireThat(mathUtils.isPowerOfTwo(-2)).equal(false);
    });
    test('power of two (8)', () {
      requireThat(mathUtils.isPowerOfTwo(8)).equal(true);
    });
    test('power of two (0.25)', () {
      requireThat(mathUtils.isPowerOfTwo(0.25)).equal(true);
    });
  });

  group('isPowerOfN should return true for all powers of N:', () {
    test('non-power of three (34, 3)', () {
      requireThat(mathUtils.isPowerOfN(34, 3)).equal(false);
    });
    test('power of four (16, 4)', () {
      requireThat(mathUtils.isPowerOfN(16, 4)).equal(true);
    });
    test('power of negative 2 (-2, -8)', () {
      requireThat(mathUtils.isPowerOfN(-8, -2)).equal(true);
    });
    test('power of negative 3 (-3, 9)', () {
      requireThat(mathUtils.isPowerOfN(9, -3)).equal(true);
    });
  });

  test('logBase should return what exponent of the base the input is', () {
    requireThat(mathUtils.logBase(2, 8)).equal(3);
  });

  test('isMathematicalInteger should return true if input is divisible by 1',
      () {
    requireThat(mathUtils.isMathematicalInteger(3.0)).equal(true);
  });

  group('factorial should return the factorial of the input:', () {
    test('factorial 5', () {
      var fac5 = mathUtils.factorial(5);
      requireThat(fac5).equal(120);
    });

    test('factorial 13', () {
      var fac13 = mathUtils.factorial(13);
      requireThat(fac13).equal(6227020800);
    });
  });

  group('fuzzy equals should return whether the two numbers are within a range of each other:', () {
    test('6 and 4, range 2', () {
      var base = mathUtils.fuzzyEquals(6, 4, 2);
      requireThat(base).equal(true);
    });

    test('4 and 6, range 2', () {
      var base = mathUtils.fuzzyEquals(4, 6, 2);
      requireThat(base).equal(true);
    });

    test('7 and 11, range 3', () {
      var base = mathUtils.fuzzyEquals(7, 11, 3);
      requireThat(base).equal(false);
    });

    test('11 and 7, range 3', () {
      var base = mathUtils.fuzzyEquals(11, 7, 3);
      requireThat(base).equal(false);
    });
  });

  group('isPrime checks if number is a prime:', () {
    test('1', () {
      requireThat(mathUtils.isPrime(1)).equal(false);
    });
    test('0', () {
      requireThat(mathUtils.isPrime(0)).equal(false);
    });
    test('7907', () {
      requireThat(mathUtils.isPrime(7907)).equal(true);
    });
    test('2', () {
      requireThat(mathUtils.isPrime(2)).equal(true);
    });
  });
}
