// import 'dart:io';
import 'dart:math';

var tempValue = <double>[0, 0, 0, 0, 0];
var tempNextIndex = [0, 0, 0, 0, 0];
var seriesSelector = 1;
bool listIsFull = false;

List listOne = [];
List listTwo = [];

void main() {
  for (int j = 0; j < 6; j++) {
    for (int i = 0; i < 61; i++) {
      try {} catch (e) {
        print(e);
      }
    }
  }
}

void getChartData() {
  fetch();
  update(tempNextIndex[1], tempValue[1], seriesSelector);
  update(tempNextIndex[2], tempValue[2], seriesSelector);
  update(tempNextIndex[3], tempValue[3], seriesSelector);
  update(tempNextIndex[4], tempValue[4], seriesSelector);
  updateZero(tempNextIndex[0], tempValue[0], seriesSelector);
}

void update(int index, value, series) {
  if (listIsFull == false) {
    listOne.add(value);
    if (listOne.length == 30) {
      listIsFull = true;
      seriesSelector = 2;
    }
  } else {
    switch (series) {
      case 1:
        if ((listOne.length + listTwo.length) < 29) {
          listTwo.removeAt(0);
          listOne.add(value);
        }
        if (listOne.length == 31) {
          seriesSelector = 2;
        }
        break;
      case 2:
        if ((listOne.length + listTwo.length) < 29) {
          listOne.removeAt(0);
          listTwo.add(value);
        }
        if (listTwo.length == 31) {
          seriesSelector = 1;
        }
        break;
      default:
        print("Something is wrong in UPADTE");
    }
  }
}

void updateZero(int index, value, series) {
  switch (series) {
    case 1:
      listOne.add(value);
      break;
    case 2:
      listTwo.add(value);
      break;
    default:
      print("Something might wrong in UPDATE_ZERO");
  }
}

int random(min, max) {
  var rn = Random();
  return min + rn.nextInt(max - min);
}

void fetch() {
  var data = random(80, 100);
  tempValue[1] = data * .25;
  tempValue[2] = data * .50;
  tempValue[3] = data * .75;
  tempValue[4] = data * 1.0;
}

void addToListOne(int value) {
//   sleep(const Duration(millisecond:400));
  listOne.add(value);
}

void deleteFromListOne() {
//   sleep(const Duration(millisecond:400));
  listOne.removeAt(0);
}

void addToListTwo(int value) {
//   sleep(const Duration(millisecond:400));
  listTwo.add(value);
}

void deleteFromListTwo() {
//   sleep(const Duration(millisecond:400));
  listTwo.removeAt(0);
}




















//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//  if (i < 30) {
//           addToListOne(i);
//           if (listTwo.isNotEmpty) {
//             deleteFromListTwo();
//           }
//           print("$listOne  $listTwo");
//         } else if (i >= 30 && i < 60) {
//           if (listOne.isNotEmpty) {
//             deleteFromListOne();
//           }
//           addToListTwo(i - 30);
//           print("$listOne  $listTwo");
//         } else {
//           print("\n*** DONE ***\n");
//         }
