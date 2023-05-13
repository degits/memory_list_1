import 'package:flutter_riverpod/flutter_riverpod.dart';

const memoryListSize = 12;

final memoryListProvider = StateNotifierProvider((ref) => MemoryList(List.filled(memoryListSize, -1)));

enum Direction {right, left}

class  MemoryList extends StateNotifier<List<int>> {
  MemoryList(super.state);

  Direction direction = Direction.right;

  bool isMemoryListFilled = false;

  int previousIndex = -1;
  // ------->
  void addItemToRight(int num) {
    if (direction == Direction.right) {
      if (previousIndex == (memoryListSize-1)) {
        previousIndex = 0;
        state[previousIndex] = num;
        state = state.toList();
      } else {
        previousIndex++;
        state[previousIndex] = num;
        state = state.toList();
      }
    } else {
      state[previousIndex] = num;
      state = state.toList();
    }
    direction = Direction.right;
    print(state);
  }

  // <---------
  void addItemToLeft(int num) {
    if (direction == Direction.left) {
      if (previousIndex == 0) {
        previousIndex = (memoryListSize-1);
        state[previousIndex] = num;
        state = state.toList();
      } else {
        previousIndex--;
        state[previousIndex] = num;
        state = state.toList();
      }
    } else {
      state[previousIndex] = num;
      state = state.toList();
    }
    direction = Direction.left;
    print(state);
  }
}


