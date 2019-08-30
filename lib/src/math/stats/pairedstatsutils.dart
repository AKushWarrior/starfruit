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

import 'statsutils.dart';
import 'dart:math';

///A class that takes in XY data and can perform some algebraic utilities
class StarStatsXY {
  Map<num,num> xy;

  ///Takes a map, formatted {x1: y1, x2: y2, x3: y3} etc.
  StarStatsXY(Map<num,num> input) {
    if (input.keys.length <3) {
      throw ArgumentError("Input must be at least three in length...");
    }
    xy = input;
  }

  ///Get the given data
  Map<num,num> get baseMap => xy;

  ///Get the x coordinates of the given data
  List<num> get x => xy.keys.toList();

  ///Get the y coordinates of the given data
  List<num> get y => xy.values.toList();

  ///Calculates the correlation coefficient .
  ///This is the strength of the linear relationship of given points.
  ///(Also known as r)
  ///The larger |r| is, the stronger the correlation
  num get corCoefficient {
    StarStats xStats = StarStats(x);
    StarStats yStats = StarStats(y);
    num Sx = xStats.stdDev;
    num Sy = yStats.stdDev;
    num r = 0;
    num avgX = xStats.mean;
    num avgY = yStats.mean;
    for (num n = 0; n < x.length; n++) {
      r += ((x[n] - avgX) * (y[n] - avgY));
    }
    r /= ((Sx * Sy)*(x.length-1));
    return r;
  }

  ///Calculates the adjusted coefficient of determination.
  ///This is the strength of the data fit for a given model
  ///Takes the degree of the model (Quadratic => 2, Linear => 1)
  ///(Also known as adjusted r^2)
  ///The larger r^2, the stronger the data fit for the model
  num detCoefficient (int degree) {
    num orig =  pow(corCoefficient, 2);
    return 1 - ((1-orig)*(x.length -1)) / (x.length - degree - 1);
  }

  ///Calculate linear regression of a set of points:
  ///Returns a list of form y = mx + b, with linearReg[0] being m and linearReg[1] being b.
  List<num> get linReg {
    List<num> slopevalue = [];
    StarStats xStats = StarStats(x);
    StarStats yStats = StarStats(y);
    num avgX = xStats.mean;
    num avgY = yStats.mean;
    num Sx = xStats.stdDev;
    num Sy = yStats.stdDev;
    num r = 0;
    num m = 0;

    //calculate r; ignore
    for (num n = 0; n < x.length; n++) {
      r += ((x[n] - avgX) * (y[n] - avgY));
    }
    r /= ((Sx * Sy)*(x.length-1));
    //end r calculation

    m = r*(Sy/Sx);
    slopevalue.add(m);

    slopevalue.add(avgY - m*(avgX));
    return slopevalue;
  }

  static double sumW2 (List<num> x, int xdeg, List<num> y, int ydeg) {
    num returner = 0;
    for (var i = 0; i<x.length; i++) {
      returner += pow(x[i], xdeg) + pow(y[i], ydeg);
    }
    return returner.toDouble();
  }

  static double sumW1 (List<num> x, int xdeg) {
    num returner = 0;
    for (var i = 0; i<x.length; i++) {
      returner += pow(x[i], xdeg);
    }
    return returner.toDouble();
  }

}