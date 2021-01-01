/*
Starfruit, a set of Dart utility libraries.
Copyright (C) 2020 Aditya Kishore

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
*/

import 'dart:math';

///Default implementation of StarCollectionsUtils().
_StarCollectionsUtils get collectionUtils => _StarCollectionsUtils();

///A class of packaged collection utilities and various commonplace functions not
///provided by (or improving upon) Dart functions. They can be used the default
///construction of StarCollectionsUtils, cUtils.
class _StarCollectionsUtils {
  ///Separate ```inp``` into a ```List``` of multiple, ```chunkSize``` ```List<Object>```'s.
  List<List<Object>> chunks (List<Object> inp, int chunkSize) {
    var i =0;
    var ret = <List<Object>>[];
    for (i = 0; i<inp.length; i+= chunkSize) {
      ret.add(inp.sublist(i, i+chunkSize));
      inp.removeRange(i, i+chunkSize);
    }
    ret.add(inp);
    return ret;
  }

  ///Collapse a ```List<List<Object>>``` into a ```List<Object>```.
  List<Object> collapse (List<List<Object>> inp) {
    var ret = <Object>[];
    for (var i in inp) {
      for (var x in i) {
        ret.add(x);
      }
    }
    return ret;
  }

  ///Return a list of every n'th (n = ```interval```) object from ```inp```.
  List<Object> nth (List<Object> inp, int interval) {
    var ret = <Object>[];
    for (var i = interval-1; i< inp.length; i+= interval) {
      ret.add(inp[i]);
    }
    return ret;
  }

  ///Return ```n``` random elements from ```inp```
  List<Object> random (List<Object> inp, [int n = 1]) {
    var ret = <Object>[];
    var random = Random.secure();
    for (var i = 0; i<n; i++) {
      ret.add(inp[random.nextInt(inp.length)]);
    }
    return ret;
  }

  ///Takes a ```Map``` and flips the keys and values.
  Map<Object,Object> flip (Map<Object, Object> inp) {
    var x = inp.keys.toList();
    var y = inp.values.toList();
    var ret = zip(y,x);
    return ret;
  }

  ///Zips two ```Lists``` into a ```Map```.
  Map<Object, Object> zip (List<Object> keys, List<Object> values) {
    var ret = <Object,Object>{};
    for (var i = 0; i<keys.length; i++) {
      var temp = <Object,Object>{keys[i]: values[i]};
      ret.addAll(temp);
    }
    return ret;
  }

  ///Unzips a ```Map``` into two ```Lists``` and returns a ```List``` containing the two ```Lists```.
  List<List<Object>> unzip (Map<Object,Object> inp) {
    var ret = <List<Object>>[];
    ret.add(inp.keys.toList());
    ret.add(inp.values.toList());
    return ret;
  }

  ///Checks if every ```Object``` in ```inp``` satisfies test
  bool every (List<Object> inp, bool Function(Object element) test) {
    for (var i in inp) {
      if (!test(i)) {
        return false;
      }
    }
    return true;
  }
}