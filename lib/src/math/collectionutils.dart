import 'dart:math';

StarCollectionsUtils get cUtils => StarCollectionsUtils();

class StarCollectionsUtils {

  ///Separate inp into a List of multiple, chunkSize List<Object>'s.
  List<List<Object>> chunks (List<Object> inp, int chunkSize) {
    var i =0;
    List<List<Object>> ret = [];
    for (i = 0; i<inp.length; i+= chunkSize) {
      ret.add(inp.sublist(i, i+chunkSize));
      inp.removeRange(i, i+chunkSize);
    }
    ret.add(inp);
    return ret;
  }

  ///Collapse a List<List<Object>> into a List<Object>.
  List<Object> collapse (List<List<Object>> inp) {
    List<Object> ret = [];
    for (var i in inp) {
      for (var x in i) {
        ret.add(x);
      }
    }
    return ret;
  }

  ///Return a list of every n'th object from inp.
  List<Object> nth (List<Object> inp, int interval) {
    List<Object> ret = [];
    for (var i = interval-1; i< inp.length; i+= interval) {
      ret.add(inp[i]);
    }
    return ret;
  }

  ///Return n random elements from inp
  List<Object> random (List<Object> inp, [int n = 1]) {
    List<Object> ret = [];
    var random = Random.secure();
    for (var i = 0; i<n; i++) {
      ret.add(inp[random.nextInt(inp.length)]);
    }
    return ret;
  }

  ///Takes a Map and flips the keys and values.
  Map<Object,Object> flip (Map<Object, Object> inp) {
    var x = inp.keys.toList();
    var y = inp.values.toList();
    Map<Object,Object> ret = zip(y,x);
    return ret;
  }

  ///Zips two Lists into a map.
  Map<Object, Object> zip (List<Object> keys, List<Object> values) {
    Map<Object,Object> ret = {};
    for (var i = 0; i<keys.length; i++) {
      Map<Object,Object> temp = {keys[i]: values[i]};
      ret.addAll(temp);
    }
    return ret;
  }

  ///Unzips a map into two Lists and returns a List containing the two Lists.
  List<List<Object>> unzip (Map<Object,Object> inp) {
    List<List<Object>> ret = [];
    ret.add(inp.keys.toList());
    ret.add(inp.values.toList());
    return ret;
  }

  ///Checks if every Object in inp satisfies test
  bool every (List<Object> inp, bool test(Object element)) {
    for (var i in inp) {
      if (!test(i)) {
        return false;
      }
    }
    return true;
  }


}