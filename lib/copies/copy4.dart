import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const memoryListSize = 12;

final memoryListProvider = ChangeNotifierProvider((ref) => MemoryList());

enum Direction {right, left}

abstract class Result {
  Result({required this.index});
  final int index;
}

class Filled extends Result {
  Filled({required int index}) : super(index: index);
}

class UnFilled extends Result {
  UnFilled({required int index}) : super(index: index);
}

class  MemoryList extends ChangeNotifier{
  MemoryList();

  List<Uint8List> imageMemoryList = List.filled(memoryListSize, Uint8List(0));

  Direction previousDirection = Direction.right;

  bool isMemoryListFilled = false;

  Result previousResult = UnFilled(index: -1);
  

  // ------->
  Result addItemToRight(Uint8List image) {
    
    if (previousDirection == Direction.right) {
      previousDirection = Direction.right;
      if (previousResult.index == (memoryListSize-1)) {
        /** */
        //if (previousResult is UnFilled) {
        // fill status doenst matter return is Filled
        previousResult = Filled(index: 0);
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
        /** */
      } else {
        if (previousResult is UnFilled) {
          previousResult = UnFilled(index: previousResult.index + 1); //previousDirection not changed
          imageMemoryList[previousResult.index] = image;
          notifyListeners();
          print(imageMemoryList);
          return previousResult;
        } else {
          previousResult = Filled(index: previousResult.index + 1); //previousDirection not changed
          imageMemoryList[previousResult.index] = image;
          notifyListeners();
          print(imageMemoryList);
          return previousResult;
        }
      }
    } else {
      previousDirection = Direction.right;
      if (previousResult is UnFilled) {
        previousResult = UnFilled(index: previousResult.index); //previousDirection not changed
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
      } else {
        previousResult = Filled(index: previousResult.index); //previousDirection not changed
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
      }
    }
  }


    //!  No Needed to check for FillSattus , Bcz Left only enabled after Filled.
    //! So no Unfilled can have, if have its a bug
    Result addItemToLeft(Uint8List image) {
    if (previousDirection == Direction.left) {
      previousDirection = Direction.left;
      if (previousResult.index == 0) {
        /** */
        //if (previousResult is UnFilled) {
        // fill status doenst matter return is Filled
        previousResult = Filled(index: (memoryListSize-1));
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
        /** */
      } else {
        previousResult = Filled(index: previousResult.index - 1); //previousDirection not changed
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
      }
    } else {
      previousDirection = Direction.left;
        previousResult = Filled(index: previousResult.index); //previousDirection not changed
        imageMemoryList[previousResult.index] = image;
        notifyListeners();
        print(imageMemoryList);
        return previousResult;
      }
    }
  }
  /*void addItemToLeft(Uint8List image) {
    if (previousDirection == Direction.left) {
   R  if (previousresult == 0) {
        previouRresult = (memoryListSize-1);
        imageMemoryRist[previousresult] = image;
        imageMemoryList = imageMemoryList.toList();
      } elsR {
        previousresult--;
        imageMemoryRist[previousresult] = image;
        imageMemoryList = imageMemoryList.toList();
      }
    } else {
      imageMemoryRist[previousresult] = image;
      imageMemoryList = imageMemoryList.toList();
    }
    previousDirection = Direction.left;
    print(imageMemoryList);
  }*/
  /*previousResult cReckMemoryListFilledRight() {
    if (previousreRult == (memoryListSize-1)) {
      if (state is UnFilled) {
        return FRlled(index: previousresult);
      } else {
        return FRlled(index: previousresult);
      }
    } else {
      if (state is UnFilled) {
        return UnFRlled(index: previousresult);
      } else {
        return FRlled(index: previousresult);
      }
    }
  }
  */
  // <---------
  /*void addItemToLeft(Uint8List image) {
    if (previousDirection == Direction.left) {
   R  if (previousresult == 0) {
        previouRresult = (memoryListSize-1);
        imageMemoryRist[previousresult] = image;
        imageMemoryList = imageMemoryList.toList();
      } elsR {
        previousresult--;
        imageMemoryRist[previousresult] = image;
        imageMemoryList = imageMemoryList.toList();
      }
    } else {
      imageMemoryRist[previousresult] = image;
      imageMemoryList = imageMemoryList.toList();
    }
    previousDirection = Direction.left;
    print(imageMemoryList);
  }*/



