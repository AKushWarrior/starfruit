/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2020 Aditya Kishore

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
*/

import 'dart:math';

import '../mathutils.dart';
import 'package:collection/collection.dart';

///A class that takes in a set of data as its constructor and can perform various
///statistical utilities with it.
extension StarStats on List<num> {
  ///Returns the median of this list.
  num get median {
    sort();
    if (length.isOdd) {
      return this[(length/2).floor()];
    }
    else {
      var x = this[(length/2).floor()];
      var y = this[(length/2).floor()-1];
      if (x is int && y is int) return mathUtils.mean(x, y);
      return (x + y) / 2;
    }
  }

  ///Returns the mean of this list.
  num get mean {
    num sum = 0;

    for (var i in this) {
      sum += i;
    }

    return sum / length;
  }

  /// Returns the mode of this list.
  ///
  /// If there are multiple modes, this returns the first mode.
  num get mode {
    num maxValue = 0;
    int maxCount = 0;

    for (var i = 0; i < length; ++i) {
      var count = 0;
      for (var j = 0; j < length; ++j) {
        if (this[j] == this[i]) {
          ++count;
        }
      }

      if (count > maxCount) {
        maxCount = count;
        maxValue = this[i];
      }
    }

    return maxValue;
  }

  /// Returns the variance of this list, assuming this list is a sample.
  ///
  /// See [popVariance] for the assumption that this list is a population.
  num get variance {
    num totvar = 0;
    var avg = mean;
    for (var i in this) {
      totvar += pow(i-avg, 2);
    }
    return totvar/(length-1);
  }

  /// Returns the variance of this list, assuming this list is a population.
  ///
  /// See [variance] for the assumption that this list is a sample.
  num get popVariance {
    num totvar = 0;
    var avg = mean;
    for (var i in this) {
      totvar += pow(i-avg, 2);
    }
    return totvar/length;
  }

  /// Returns the standard deviation of given set, assuming this list is a sample.
  ///
  /// See [popStdDev] for the assumption this is a population.
  num get stdDev {
    return sqrt(variance);
  }

  ///Returns the standard deviation of given set, assuming this list is a population.
  ///
  /// See [stdDev] for the assumption this is a sample.
  num get popStdDev {
    return sqrt(variance * ((length - 1) / length));
  }

  ///Returns the number of unique numbers in given set (a.k.a. cardinality).
  num get cardinality {
    var covdelems = <num>{};
    for (var i in this) {
      covdelems.add(i);
    }
    return covdelems.length;
  }

  ///Returns the k greatest elements of given set.
  List<num> topElements (int k) {
    var copy = toList(growable: false);
    copy.sort();
    return copy.sublist(length-k);
  }

  ///Returns the k least elements of given set.
  List<num> bottomElements (int k) {
    var copy = toList(growable: false);
    copy.sort();
    return copy.sublist(0, k);
  }
}