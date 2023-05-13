import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoryListProvider = StateNotifierProvider((ref) => MemoryList(List.filled(10, -1)));

const memoryListSize = 10;

enum Direction {right, left}

class  MemoryList extends StateNotifier<List<int>> {
  MemoryList(super.state);

  Direction direction = Direction.right;

  bool isMemoryListFilled = false;

  int previousIndex = -1;

  // ------->
  void addItemToRight(int num) {
    if (direction == Direction.right) {
      if (previousIndex == 9) {
        previousIndex = 0;
        state[previousIndex] = num;
      } else {
        previousIndex++;
      state[previousIndex] = num;
      }
    } else {
      state[previousIndex] = num;
    }
    direction = Direction.right;
    print(state);
  }

  void addItemToLeft(int num) {
    if (direction == Direction.left) {
      if (previousIndex == 0) {
        previousIndex = 9;
        state[previousIndex] = num;
      } else {
        previousIndex--;
        state[previousIndex] = num;
      }
    } else {
      state[previousIndex] = num;
    }
    direction = Direction.left;
    print(state);
  }

 }
    /*if (isMemoryListFilled == true) {
      circularIndexIncrementation();
      //state[previousIndex] = image;
      state[previousIndex] = num;
    } else {
      //state[previousIndex] = image;
      /*if (previousIndex == (memoryListSize-1)) {
        previousIndex = MemoryListFillStatus.filled;
      }*/
      state[previousIndex] = num;
      circularIndexIncrementation();
      
    }*/
    /*if (d == Direction.init || d == Direction.left) {
      d = Direction.right;
      state[previousIndex] = num;
      circularIndexIncrementation();
    } else {
      d = Direction.right;
      state[previousIndex] = num;
      circularIndexIncrementation();
      
    }
    */
    //print(state);
  
  // for inc and dec ,
  // not needed for reading because index is stored on image list
  /*void circularIndexIncrementation() {
    print("circular indexIncremented call");
    if (previousIndex == memoryListSize-1) {
      previousIndex = 0;
    } else {
      previousIndex++;
    }
  }*/

  // <-------
  
  
  

  /*void circularIndexDecrementation() {
    if (previousIndex == 0) {
      previousIndex = memoryListSize - 1;
    } else {
      previousIndex--;
    }
  }*/


