/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2020 Aditya Kishore

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
*/

import 'statsutils.dart';
import 'package:linalg/linalg.dart';
import 'dart:math';

///A class that takes in XY data and can perform some algebraic utilities.
extension StarStatsXY on Map<num, num> {
  ///Get the x coordinates of the given data.
  List<num> get x => keys.toList();

  ///Get the y coordinates of the given data.
  List<num> get y => values.toList();

  ///Calculates the correlation coefficient.
  ///This is the strength of the linear relationship of given points.
  ///
  ///(Also known as r) The larger abs(r) is, the stronger the correlation.
  num get corCoefficient {
    var Sx = x.stdDev;
    var Sy = y.stdDev;
    num r = 0;
    var avgX = x.mean;
    var avgY = y.mean;
    for (var n = 0; n < x.length; n++) {
      r += ((x[n] - avgX) * (y[n] - avgY));
    }
    r /= ((Sx * Sy)*(x.length-1));
    return r;
  }

  ///Calculates the coefficient of determination.
  ///This is the strength of the data fit for a given model.
  ///
  ///(Also known as r^2). The larger r^2, the stronger the data fit for the model.
  ///
  ///The adjusted determination coefficient is usually more accurate.
  num get detCoefficient {
    return pow(corCoefficient,2);
  }

  ///Calculates the adjusted coefficient of determination.
  ///This is the strength of the data fit for a given model.
  ///
  ///(Also known as adjusted r^2). The larger adjusted r^2, the stronger the data fit for the model.
  ///
  ///More accurate than normal determination coefficient.
  num get adjDetCoefficient {
    var n = x.length;
    var orig = pow(corCoefficient, 2);
    return 1 - (1-orig)*((n-1)/(n-2));
  }

  ///Calculate linear regression of a set of points: Returns a list of form y =
  ///mx + b, with `linearReg[0]` being m and `linearReg[1]` being b.
  List<num> get linReg {
    var slopevalue = <num>[];
    var avgX = x.mean;
    var avgY = y.mean;
    var Sx = x.stdDev;
    var Sy = y.stdDev;
    num r = 0;
    num m = 0;

    //calculate r; ignore
    for (var n = 0; n < x.length; n++) {
      r += ((x[n] - avgX) * (y[n] - avgY));
    }
    r /= ((Sx * Sy)*(x.length-1));
    //end r calculation

    m = r*(Sy/Sx);
    slopevalue.add(m);

    slopevalue.add(avgY - m*(avgX));
    return slopevalue;
  }

  ///Calculate quadratic regression of a set of points: Returns a list of form y =
  ///ax^2 + bx + c, with `quadReg[0]` being a, `quadReg[1]` being b, and `quadreg[2]` being c.
  List<num> get quadReg {
    var yy = <double>[];
    var xx = <double>[];
    for (var numb in y) {
      yy.add(numb.toDouble());
    }
    for (var numb in x) {
      xx.add(numb.toDouble());
    }
    var xcol1 = List<double>.filled(xx.length, 1.0);
    var xcol3 = List<double>.filled(xx.length, 0);
    for (var i = 0; i <xx.length; i++) {
      xcol3[i] = pow(xx[i],2).toDouble();
    }
    var Y = Matrix([yy]).transpose();
    var X = Matrix([xcol1, xx, xcol3]).transpose();
    var B = (X.transpose() * X).inverse() * X.transpose() * Y;
    var c = B[0][0];
    var b = B[1][0];
    var a = B[2][0];
    return [a,b,c];
  }

  ///Calculate quadratic regression of a set of points: Returns a list of form y =
  ///ax^3 + bx^2 + cx + d, with `cubicReg[0]` being a, `cubicReg[1]` being b, `cubicReg[2]` being c, and `cubicReg[3]` being d.
  List<num> get cubicReg {
    var yy = <double>[];
    var xx = <double>[];
    for (var numb in y) {
      yy.add(numb.toDouble());
    }
    for (var numb in x) {
      xx.add(numb.toDouble());
    }
    var xcol1 = List<double>.filled(xx.length, 1.0);
    var xcol3 = List<double>.filled(xx.length, 0);
    for (var i = 0; i <xx.length; i++) {
      xcol3[i] = pow(xx[i],2).toDouble();
    }
    var xcol4 = List<double>.filled(xx.length, 0);
    for (var i = 0; i <xx.length; i++) {
      xcol4[i] = pow(xx[i],3).toDouble();
    }
    var Y = Matrix([yy]).transpose();
    var X = Matrix([xcol1, xx, xcol3, xcol4]).transpose();
    var B = (X.transpose() * X).inverse() * X.transpose() * Y;
    var d = B[0][0];
    var c = B[1][0];
    var b = B[2][0];
    var a = B[3][0];
    return [a,b,c,d];
  }

  ///Calculate quartic regression of a set of points: Returns a list of form y =
  ///ax^4 + bx^3 + cx^2 + dx + e, with `cubicReg[0]` being a, `cubicReg[1]` being b,
  ///`cubicReg[2]` being c, `cubicReg[3]` being d, and `cubicReg[4]` being e.
  List<num> get quarReg {
    var yy = <double>[];
    var xx = <double>[];
    for (var numb in y) {
      yy.add(numb.toDouble());
    }
    for (var numb in x) {
      xx.add(numb.toDouble());
    }
    var xcol1 = List<double>.filled(xx.length, 1.0);
    var xcol3 = List<double>.filled(xx.length, 0);
    for (var i = 0; i < xx.length; i++) {
      xcol3[i] = pow(xx[i], 2).toDouble();
    }
    var xcol4 = List<double>.filled(xx.length, 0);
    for (var i = 0; i <xx.length; i++) {
      xcol4[i] = pow(xx[i],3).toDouble();
    }
    var xcol5 = List<double>.filled(xx.length, 0);
    for (var i = 0; i <xx.length; i++) {
      xcol5[i] = pow(xx[i],4).toDouble();
    }
    var Y = Matrix([yy]).transpose();
    var X = Matrix([xcol1, xx, xcol3, xcol4, xcol5]).transpose();
    var B = (X.transpose() * X).inverse() * X.transpose() * Y;
    var e = B[0][0];
    var d = B[1][0];
    var c = B[2][0];
    var b = B[3][0];
    var a = B[4][0];
    return [a,b,c,d,e];
  }
}