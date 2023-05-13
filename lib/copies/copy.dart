import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MemoryListFillStatus {filled, unFilled}
/*
abstract class MemoryListFillStatus {}

class Filled extends MemoryListFillStatus {}

class UnFilled extends MemoryListFillStatus {}
*/
const memoryListSize = 100;

final memoryListProvider = StateNotifierProvider((ref) => MemoryList(MemoryListFillStatus.unFilled));

class  MemoryList extends StateNotifier<MemoryListFillStatus> {
  MemoryList(super.state);

  final List<int/*Uint8List*/> _items = List.filled(memoryListSize, -1/*Uint8List(0)*/);


  int currentIndex = 0;

  // ------->
  void addItemToRight(/*Uint8List image*/) {
    print("addItemToRight called");
    
    if (state == MemoryListFillStatus.filled) {
      circularIndexIncrementation();
      //_items[currentIndex] = image;
    } else {
      //_items[currentIndex] = image;
      if (currentIndex == (memoryListSize-1)) {
        state = MemoryListFillStatus.filled;
      }
      circularIndexIncrementation();
    }
    print(currentIndex);
  }

  // <-------
  void addItemToLeft(/*Uint8List image*/) {
    if (state == MemoryListFillStatus.unFilled) {
      throw ErrorDescription("You cannot call this method untill memory list filled !");
    }
    //_items[currentIndex] = image;
    circularIndexDecrementation();

  }
  
  // for inc and dec ,
  // not needed for reading because index is stored on image list
  void circularIndexIncrementation() {
    if (currentIndex == memoryListSize-1) {
      currentIndex = 0;
    } else {
      currentIndex++;
    }
  }

  void circularIndexDecrementation() {
    if (currentIndex == 0) {
      currentIndex = memoryListSize - 1;
    } else {
      currentIndex--;
    }
  }
}

