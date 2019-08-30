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

import '../mathutils.dart';

///A class that takes in a set of data as its constructor and can perform various
///statistical utilities with it.
class StarStats {
  List<num> a;

  ///Takes a set of numerical data
  StarStats(List<num> input) {
    a = input;
  }

  ///Get given data
  List<num> get baseSet => a;

  ///returns the median of given set
  num get median {
    a.sort();
    if (a.length.isOdd) {
      return a[(a.length/2).floor()];
    }
    else {
      var x = a[(a.length/2).floor()];
      var y = a[(a.length/2).floor()-1];
      return StarMathUtils().mean(x, y);
    }
  }

  ///returns the mean of given set
  num get mean {
    num sum = 0;

    for (var i in a) {
      sum += i;
    }

    return sum/a.length;
  }

  ///returns the mode of given set
  num get mode {
    int maxValue = 0, maxCount = 0, i, j;

    for (i = 0; i < a.length; ++i) {
      int count = 0;
      for (j = 0; j < a.length; ++j) {
        if (a[j] == a[i]) {
          ++count;
        }
      }

      if (count > maxCount) {
        maxCount = count;
        maxValue = a[i];
      }
    }
    return maxValue;
  }

  ///returns the variance of given set
  num get variance {
    num totvar = 0;
    num avg = mean;
    for (var i in a) {
      totvar += pow(i-avg, 2);
    }
    return totvar/(a.length-1);
  }

  ///returns the standard deviation of given set
  num get stdDev {
    return sqrt(variance);
  }

  ///Returns the number of unique digits in given set (cardinality)
  num get cardinality {
    List<num> covdelems = [];
    for (var i in a) {
      if (!covdelems.contains(i)) {
        covdelems.add(i);
      }
    }
    return covdelems.length;
  }

  ///Returns the k greatest elements of given set
  List<num> topElements (num k) {
    a.sort();
    return a.sublist(a.length-k);
  }

  ///Returns the k least elements of given set
  List<num> bottomElements (num k) {
    a.sort();
    return a.sublist(0,k);
  }
}