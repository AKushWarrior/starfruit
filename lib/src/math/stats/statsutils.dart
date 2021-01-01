/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2020 Aditya Kishore

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
*/

import 'dart:math';

import '../mathutils.dart';

///A class that takes in a set of data as its constructor and can perform various
///statistical utilities with it.
extension StarStats on List<num> {
  ///Returns the median of given set.
  num get median {
    sort();
    if (length.isOdd) {
      return this[(length/2).floor()];
    }
    else {
      var x = this[(length/2).floor()];
      var y = this[(length/2).floor()-1];
      return mathUtils.mean(x, y);
    }
  }

  ///Returns the mean of given set.
  num get mean {
    num sum = 0;

    for (var i in this) {
      sum += i;
    }

    return sum/length;
  }

  ///Returns the mode of given set.
  num get mode {
    int maxValue = 0, maxCount = 0, i, j;

    for (i = 0; i < length; ++i) {
      var count = 0;
      for (j = 0; j < length; ++j) {
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

  ///Returns the variance of given set.
  num get variance {
    num totvar = 0;
    var avg = mean;
    for (var i in this) {
      totvar += pow(i-avg, 2);
    }
    return totvar/(length-1);
  }

  ///Returns the standard deviation of given set.
  num get stdDev {
    return sqrt(variance);
  }

  ///Returns the number of unique digits in given set (a.k.a. cardinality).
  num get cardinality {
    var covdelems = <num>[];
    for (var i in this) {
      if (!covdelems.contains(i)) {
        covdelems.add(i);
      }
    }
    return covdelems.length;
  }

  ///Returns the k greatest elements of given set.
  List<num> topElements (num k) {
    sort();
    return sublist(length-k);
  }

  ///Returns the k least elements of given set.
  List<num> bottomElements (num k) {
    sort();
    return sublist(0,k);
  }
}