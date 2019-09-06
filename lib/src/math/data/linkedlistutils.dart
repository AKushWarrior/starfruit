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
GNU Lesser General Public License for more details.
*/

import 'dart:core';

///A class creating a very basic LinkedList implementation.
///
///To use, simply construct with a List<Object> as parameter.
class StarLinkedList {
  /// First node of the list
  ///
  /// NOT FOR EXTERNAL USE
  Node head;

  /// Length of the LinkedList
  int length;

  ///Constructs a LinkedList out of a List<Object>
  StarLinkedList(List<Object> args) {
    head = Node(args[0]);
    Node current = head;
    for (var i = 1; i < args.length; i++) {
      current.next = Node(args[i]);
      current = current.next;
    }
    length = args.length;
  }

  ///Pushes a new Object to the front of the LinkedList
  ///
  /// Much faster than add()
  void push (Object arg) {
    Node new_Node = Node(arg);
    new_Node.next = head;
    head = new_Node;
    length++;
  }

  ///Adds a new Object to the back of the LinkedList
  ///
  /// Much slower than push()
  void add (Object arg) {
    Node current = head;
    int count = 0;
    while (current != null) {
      if (count == length-1) {
        current.next = Node(arg);
        length++;
        return;
      }
      count++;
      current = current.next;
    }

  }

  ///Fetches the given index of the LinkedList.
  Object operator [] (int index) {
    if (index == 0) {return head.core;}
    else {
      Node current = head.next;
      int count = 1;
      while (current != null)
      {
        if (count == index) {
          return current.core;
        }
        count++;
        current = current.next;
      }
      throw ArgumentError("Invalid index provided.");
    }
  }

  ///Accessor for first value.
  Object get first => head.core;

  ///Concatenates two LinkedLists together.
  StarLinkedList operator +(StarLinkedList other) {
    List<Object> cores = [];
    for (var i = 0; i < this.length; i++) {
      cores.add(this[i]);
    }
    for (var i = 0; i < other.length; i++) {
      cores.add(other[i]);
    }
    return StarLinkedList(cores);
  }

  ///Assignment of a given index e.g.
  ///
  /// ```llist[4] = 25```
  void operator []=(int index, Object value) {
    if (index == 0) {
      var temp = head.next;
      head = Node(value);
      head.next = temp;
      return;
    }
    else {
      Node current = head.next;
      int count = 1;
      while (current != null)
      {
        if (count == index -1) {
          var temp = current.next.next;
          current.next = Node(value);
          current.next.next = temp;
          return;
        }
        count++;
        current = current.next;
      }
      throw ArgumentError("Invalid index provided.");
    }
  }

  ///Adds List<Object> to LinkedList
  StarLinkedList addAll(List<Object> arg) {
    return this + StarLinkedList(arg);
  }

  ///Checks if a given element is in the LinkedList
  bool contains(Object element) {
    for (var i = 0; i < length; i++) {
      if (this[i] == element) {return true;}
    }
    return false;
  }

  ///Removes the first Object with the given value
  void remove(Object value) {
    for (var i = 0; i < length; i++) {
      if (this[i] == value) {
        delete(i);
        return;
      }
    }
    throw ArgumentError("Invalid value passed");
  }

  ///Deletes the value at the given index
  void delete(int index)
  {
    if (index == 0) {
      head = head.next;
      length -= 1;
      return;
    }
    else if (index == 1) {
      head.next = head.next.next;
      length -= 1;
      return;
    }
    else {
      Node current = head;
      int count = 0;
      while (current != null)
      {
        if (count == index-1) {
          current.next = current.next.next;
          length -=1;
          return;
        }
        count++;
        current = current.next;
      }
    }
    throw ArgumentError("Invalid index passed");
  }

  /// Takes a sublist with the given start point and end point.
  ///
  /// Returns sublist with indices ```[start, start+1, start+2...end-1]```.
  ///
  /// Assumes end to be length if not provided.
  StarLinkedList sublist(int start, [int end]) {
    if (end == null) {
      end = length;
    }
    List<Object> values = [];
    Node current = head;
    for (var i = 0; i<start; i++) {
      current = current.next;
    }
    for (var i = start; i < end; i++) {
      values.add(current.core);
      current = current.next;
    }
    return StarLinkedList(values);
  }

  ///Converts StarLinkedList to List.
  List<Object> toList () {
    List<Object> cores = [];
    for (var i = 0; i < this.length; i++) {
      cores.add(this[i]);
    }
    return cores;
  }

  ///String representation for debugging purposes.
  String toString () {
    return toList().toString();
  }
}

/// NOT INTENDED FOR EXTERNAL USAGE
///
/// DO NOT USE
class Node {
  Object data;
  Node next;

  // Constructor to create a new node.

  // Next is by default initialized
  // as null.
  Node(Object d) {data = d;}

  Object get core => data;
}