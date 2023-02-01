import 'dart:core';
import 'dart:math';

import 'package:harcapp/_common_classes/rect_decomp/sortable_rectangle.dart';
import 'package:harcapp/_common_classes/rect_decomp/temporary_rectangle.dart';
import 'package:harcapp/_common_classes/rect_decomp/utils/rectangle_deque.dart';

import 'binary_matrix.dart';
import 'decomposition_result.dart';
import 'linked_matrix.dart';
import 'linked_matrix_element.dart';

class WSMRDecomposer {

  static int MIN_AREA = 1;

  BinaryMatrix? binaryMatrix;

  List<List<int>>? temp1;

  List<List<int>>? temp2;

  List<List<int>>? temp3;

  List<List<int>>? temp4;

  bool preprocessed;

  LinkedMatrixElement? currentPoint;

  SortableRectangle? largestOne;

  bool? removeLargestFirst;

  int area;

  int xToCheck;

  int yToCheck;

  int xTotal;

  int yTotal;

  LinkedMatrix? linkedMatrix;

  int? areaTmp;

  RectangleDeque? stack;

  List<SortableRectangle>? rectangles;

  WSMRDecomposer(BinaryMatrix m):
        removeLargestFirst = false,
        area = -1,
        xToCheck = -1,
        yToCheck = -1,
        xTotal = -1,
        yTotal = -1,
        preprocessed = false
  {
    binaryMatrix = m;
    temp1 = List.generate(m.row, (_) => List.filled(m.col, 0));
    temp2 = List.generate(m.row, (_) => List.filled(m.col, 0));
  }

  SortableRectangle findLargestRectangle() {
    firstStep();
    secondStep();
    thirdStep();
    fourthStep();

    return firstLargestRectangle();
  }

  void firstStep() {
    int current;
    for (int j = 0; j < binaryMatrix!.col; j++) {
      current = 1;
      for (int i = binaryMatrix!.row - 1; i >= 0; i--) {
        if (binaryMatrix!.matrix[i][j]) {
          temp1![i][j] = current;
          current++;
        } else
          current = 1;

      }
    }
  }

  void secondStep() {
    int current;
    for (int i = 0; i < binaryMatrix!.row; i++) {
      current = 1;
      for (int j = binaryMatrix!.col - 1; j >= 0; j--) {
        if (binaryMatrix!.matrix[i][j]) {
          temp2![i][j] = current;
          current++;
        } else {
          current = 1;
        }

      }
    }
  }

  void thirdStep() {
    temp3 = List.filled(temp1!.length, []);
    for (int i = 0; i < temp1!.length; i++)
      temp3![i] = List.of(temp1![i]);
    temp4 = List.filled(temp2!.length, []);
    for (int i = 0; i < temp2!.length; i++)
      temp4![i] = List.of(temp2![i]);
    int previous;
    for (int i = 0; i < binaryMatrix!.row; i++) {
      previous = 0;
      for (int j = binaryMatrix!.col - 1; j >= 0; j--) {
        if (previous == 0) {
          // Leave unchanged
          previous = temp3![i][j];
        } else if (temp3![i][j] <= previous) {
          previous = temp3![i][j];
        } else {
          temp3![i][j] = previous;
        }

      }
    }

    for (int j = 0; j < binaryMatrix!.col; j++) {
      previous = 0;
      for (int i = binaryMatrix!.row - 1; i >= 0; i--) {
        if (previous == 0)
          previous = temp2![i][j];
        else if (temp4![i][j] <= previous)
          previous = temp2![i][j];
        else
          temp4![i][j] = previous;
      }
    }
  }

  void fourthStep() {
    List<int> area_tmp = [-1, -1]; // two elements;
    int largestArea = -1, x = 0, y = 0, width = 0, height = 0;
    linkedMatrix = LinkedMatrix(binaryMatrix!.matrix);
    LinkedMatrixElement current = linkedMatrix!.getCurrentRoot();
    for (int i = 0; i < binaryMatrix!.row; i++) {
      for (int j = 0; j < binaryMatrix!.col; j++) {
        current = current.nextRight!;
        if (binaryMatrix!.matrix[i][j]) {
          area_tmp[0] = temp3![i][j] * temp2![i][j];
          area_tmp[1] = temp1![i][j] * temp4![i][j];
          int maxArea = max(area_tmp[0], area_tmp[1]);

          if (maxArea == area_tmp[0]) {
            temp2![i][j] = temp2![i][j];
            temp1![i][j] = temp3![i][j];
          } else {
            temp2![i][j] = temp4![i][j];
            temp1![i][j] = temp1![i][j];
          }
          // Update largest rectangle
          if (maxArea > largestArea) {
            largestArea = maxArea;
            linkedMatrix!.largestRectangle = current;
            x = i;
            y = j;
            if (maxArea == area_tmp[0]) {
              width = temp2![i][j];
              height = temp3![i][j];
            } else {
              width = temp4![i][j];
              height = temp1![i][j];
            }
          }
        } else {
          current = linkedMatrix!.deleteZero(current)!;
        }
      }
    }
    if (largestArea != -1)
      largestOne = SortableRectangle(x, y, width, height);
  }

  SortableRectangle firstLargestRectangle() {
    int area = 0;
    int x = 0;
    int y = 0;
    int width = 0;
    int height = 0;
    List<int> area_tmp = [-1, -1]; // 2 element;
    for (int i = 0; i < binaryMatrix!.row; i++) {
      for (int j = 0; j < binaryMatrix!.col; j++) {
        if (binaryMatrix!.matrix[i][j]) {
          area_tmp[0] = temp3![i][j] * temp2![i][j];
          area_tmp[1] = temp1![i][j] * temp4![i][j];
          int maxArea = max(area_tmp[0], area_tmp[1]);

          if (maxArea > area) {
            x = i;
            y = j;
            if (maxArea == area_tmp[0]) {
              width = temp2![i][j];
              height = temp3![i][j];
            } else {
              width = temp4![i][j];
              height = temp1![i][j];
            }
            area = maxArea;
          }
        }
      }
    }
    return SortableRectangle(x, y, width, height);
  }

  void preProcess() {
    firstStep();

    secondStep();

    thirdStep();

    fourthStep();
    preprocessed = true;

  }

  DecompositionResult computeDecomposition(int min) {
    WSMRDecomposer.MIN_AREA = min;
    if (!preprocessed)
      preProcess();

    rectangles = [];
    stack = RectangleDeque(
        linkedMatrix!.height,
        linkedMatrix!.width);
    if (removeLargestFirst!) {
      LinkedMatrixElement largestUpperLeft = linkedMatrix!.largestRectangle!;
      addRectangle(largestUpperLeft, largestOne!.height, largestOne!.width);

    }

    currentPoint = linkedMatrix!.getFirstElement();

    do {
      if (currentPoint == null || currentPoint!.isNull()) {
        // Move to the first element of the matrix
        currentPoint = linkedMatrix!.getFirstElement();
      }

      process();
      print("${currentPoint!.x} ${currentPoint!.y} ${stack!.length}");

    } while (!linkedMatrix!.isEmpty());

    int ones = binaryMatrix!.numberOfOnes;
    temp1 = null;
    temp2 = null;
    temp3 = null;
    temp4 = null;
    binaryMatrix = null;
    return DecompositionResult(rectangles!, ones);
  }

  void process() {

    if (stack!.length == 0) {

      // Add new rectangle
      if (stackNewRectangle()) {
        setCounters();
        updateCounters();
        goNextElementEmptyStack();
      } else
        currentPoint = linkedMatrix!.getFirstElement();

    } else {
      areaTmp = getArea(currentPoint!);
      if (areaTmp! > area) {

        // Take care of previous rectangle
        checkUpdateOldRectangle();
        // Start new rectangle
        if (stackNewRectangle()) {
          setCounters();
          updateCounters();
          // Try to merge
          tryMerge();
          goNextElementStack();
        } else
          currentPoint = linkedMatrix!.getFirstElement();

      } else {

        // Update counters
        updateCounters();
        if (!foundAndMerge())
          goNextElementStack();
      }

    }

  }

  void setCounters() {
    xToCheck = xTotal;
    yToCheck = yTotal;
  }

  bool foundAndMerge() {
    if (stack!.length == 0)
      return true;// can happen at the end

    if (!(xToCheck == 0))
      return false;
    if (stack!.length == 1) {

      if (stack!.peek()!.validated) {
        removeCurrentRectangle();

        return true;
      } else
        return false;
    }

    // Rectangle found
    if (!tryMerge()) {

      stack!.peek()!.validated = true;
      stack!.peek()!.potentialSecondArea = 0;
      emptyStack();

    }
    return true;

  }

  bool tryMerge() {
    if (!mergeHorizontal()) {

      if (mergeVertical()) {

        if (stack!.peek()!.validated)
          return false;

        return true;
      }
    } else
      return true;

    return false;

  }

  LinkedMatrixElement? removeCurrentRectangle() {

    TemporaryRectangle? temp = stack!.poll();
    if (temp == null)
      return null;
    if (!temp.validated)
      potentialVSvalidated();

    addRectangle(temp.upperLeftCorner, temp.height, temp.width);

    if (stack!.length > 0) {
      if (!stack!.peek()!.validated) {
        area = stack!.peek()!.area;
      } else
        area = 0;
    }
    return temp.upperLeftCorner;
  }

  void updateCounters() {
    stack!.peek()!.currentPosition = currentPoint!;
    if (yToCheck == yTotal)
      stack!.peek()!.lastLineFirstElement = currentPoint!;
    if (yToCheck > 0)
      --yToCheck;

    if (yToCheck == 0) {
      xToCheck--;
      if (xToCheck != 0)
        yToCheck = yTotal;
      else {
        if (stack!.length > 0)
          stack!.peek()!.validated = true;
      }

    }

  }

  void checkUpdateOldRectangle() {
    // If current point is in the first line of the old rectangle, update
    // its width (case 1)
    if (stack!.peek()!.validated)
      return;
    if (stack!.peek()!.height == 1) {
      stack!.peek()!.width = max(currentPoint!.y - stack!.peek()!.upperLeftCorner.y, 1);
      stack!.peek()!.validated = true;
    } else if (xToCheck == xTotal) {// First line
      // Update width of the rectangle
      stack!.peek()!.width = currentPoint!.y - stack!.peek()!.upperLeftCorner.y;

    } else if (stack!.peek()!.lastLineFirstElement.isNextElementDownConsecutive()
        && stack!.peek()!.lastLineFirstElement.nextDown == currentPoint) {
      // Case 2 in the paper

      // Update the height
      stack!.peek()!.height = xTotal - xToCheck;

      stack!.peek()!.validated = true;
      // nothing under
    }
    // Merge the rectangles.
    tryMerge();

  }

  void emptyStack() {

    removeCurrentRectangle();
    while (stack!.length > 0 && stack!.peek()!.validated)
      removeCurrentRectangle();

    if (stack!.length > 0)
      // Choose the best cut
      potentialVSvalidated();

  }

  void goNextElementEmptyStack() {
    if (yToCheck == yTotal) {

      if (!currentPoint!.isNextElementDownConsecutive()) {

        stack!.peek()!.height = 1;
        stack!.peek()!.width = 1;
        stack!.peek()!.validated = true;
        stack!.peek()!.potentialSecondArea = 0;
        // stack.peek().setUpperLeftCorner(oldCurrentPoint);
        if (!currentPoint!.isNextElementRightConsecutive()) {
          // Remove
          removeCurrentRectangle();
          currentPoint = linkedMatrix!.getFirstElement();

        } else {
          area = 0;
          mergeOrRemove(false);
        }

      } else {
        currentPoint = currentPoint!.nextDown;
      }
    } else {
      tryNextRight();
    }

  }

  void tryNextRight() {
    if (currentPoint!.isNextElementRightConsecutive()) {
      currentPoint = currentPoint!.nextRight;
    } else {

      // Compute the potential second area
      if (stack!.length > 0) {

        mergeOrRemove(true);
      } else {
        currentPoint = linkedMatrix!.getFirstElement();
      }
    }
  }

  void mergeOrRemove(bool isRight) {
    if (isRight) { // case where we wanted to go right
      if (stack!.length == 1 && xToCheck == xTotal) {// First line of empty

        TemporaryRectangle tempRectangle = stack!.peek()!;
        stack!.peek()!.width =
            tempRectangle.currentPosition.y - tempRectangle.upperLeftCorner.y + 1;
        stack!.peek()!.height = 1;
        stack!.peek()!.validated = true;
        yTotal = stack!.peek()!.width;
        yToCheck = yTotal;
        xToCheck--;// EOL
        area = stack!.peek()!.area;
        stack!.peek()!.potentialSecondArea = 0;
        if (tempRectangle.lastLineFirstElement
            .isNextElementDownConsecutive()) {

          stack!.peek()!.height = 2;
          xTotal++;
          xToCheck++;
          area = stack!.peek()!.area;
          stack!.peek()!.validated = false;
          stack!.peek()!.potentialSecondArea = -1;
          currentPoint = tempRectangle.lastLineFirstElement.nextDown;
        } else {

          removeCurrentRectangle();
          currentPoint = linkedMatrix!.getFirstElement();

        }
      } else if (stack!.length > 1) {

        // try merge
        if (xToCheck == xTotal) {// on the first line

          // update width
          TemporaryRectangle tempRectangle = stack!.peek()!;
          stack!.peek()!.width =
              tempRectangle.currentPosition.y - tempRectangle.upperLeftCorner.y + 1;
          // stack.peek().setHeight(1);

          int oldsize = stack!.length;
          // Update counters
          yTotal = stack!.peek()!.width;
          yToCheck = yTotal;
          xToCheck--;// EOL
          if (xToCheck == 0) {
            stack!.peek()!.validated = true;
            stack!.peek()!.potentialSecondArea = 0;
          }
          area = stack!.peek()!.area;
          if (!tryMerge()) {
            // Merge didn't work go next element
            if (stack!.length > 0) {
              if (oldsize != stack!.length)
                potentialVSvalidated();
              else
                goNextElementStack();
            } else
              currentPoint = linkedMatrix!.getFirstElement();
          } else {
            goNextElementStack();
          }

        } else {
          potentialVSvalidated();
        }
      } else {

        potentialVSvalidated();

      }
    } else {// case where we wanted to go down - stack point

      stack!.peek()!.height = 1;
      tryMerge();
      currentPoint = currentPoint!.nextRight;
      if (currentPoint == null)
        potentialVSvalidated();
    }
  }

  void mergeOrRemoveDepop(bool isRight) {
    if (isRight) { // case where we wanted to go right
      // try merge
      if (xToCheck == xTotal) {// on the first line
        // update width
        TemporaryRectangle tempRectangle = stack!.peek()!;
        stack!.peek()!.width = (
            tempRectangle.currentPosition.y
                - tempRectangle.upperLeftCorner.y);
        stack!.peek()!.height = 1;
        stack!.peek()!.validated = true;
        stack!.peek()!.potentialSecondArea = 0;
      }
      if (stack!.length > 1)
        tryMerge();

    } else {// case where we wanted to go down - stack point
      tryMerge();
      currentPoint = currentPoint!.nextRight;
      if (currentPoint == null)
        potentialVSvalidated();
    }
  }

  void potentialVSvalidated() {
    if (stack!.length == 0) {
      currentPoint = linkedMatrix!.getFirstElement();
      return;
    }
    // Remove the validated part
    TemporaryRectangle tempRectangle = stack!.peek()!;

    if (tempRectangle.validated && tempRectangle.potentialSecondArea == 0) {
      removeCurrentRectangle();
      if (stack!.length > 0)
        potentialVSvalidated();
      return;
    }
    // Case where cutpoint is current point
    if (tempRectangle.currentPosition == tempRectangle.upperLeftCorner) {

      if (tempRectangle.height > 1 && tempRectangle.width == 1) {
        if (tempRectangle.currentPosition.isNextElementDownConsecutive()) {
          updateCounterToCurrentRectangle();
          xToCheck--;
          tryNextDown();
        } else {
          tempRectangle.height = 1;
          if (!tryMerge())
            removeCurrentRectangle();

        }

      } else {
        updateCounterToCurrentRectangle();
        goNextElementStack();

      }

    } else {
      LinkedMatrixElement cutPoint = tempRectangle.currentPosition;
      int height = cutPoint.x - tempRectangle.upperLeftCorner.x;

      // Case where first element is point
      if (height == 0 && (xToCheck == xTotal) && stack!.length == 1) {

        tempRectangle.width = 1;
        tempRectangle.height = 1;
        if (!tryMerge())
          removeCurrentRectangle();

      } else if (height != 0) {

        // Delete the rectangle
        stack!.poll();
        tempRectangle.height = height;
        addRectangle(tempRectangle.upperLeftCorner, height, tempRectangle.width);
        temp2![tempRectangle.lastLineFirstElement.x][tempRectangle.lastLineFirstElement.y] =
            tempRectangle.currentPosition.y - tempRectangle.upperLeftCorner.y + 1;
        LinkedMatrixElement oldcurrent = currentPoint!;

        currentPoint = tempRectangle.lastLineFirstElement;
        stackNewRectangle();
        currentPoint = oldcurrent;
        setCounters();
        // Set the end of line
        xToCheck--;
        if (stack!.length == 0)
          return;

        // Want to go to the right
        mergeOrRemoveDepop(true);
      } else {
        if (stack!.length == 0)
          return;

        // Change the width of the rectangle
        stack!.peek()!.width =
            tempRectangle.currentPosition.y - tempRectangle.upperLeftCorner.y + 1;
        // Update the counters
        xToCheck = stack!.peek()!.height - 1;
        xTotal = stack!.peek()!.height;
        yTotal = stack!.peek()!.width;
        yToCheck = stack!.peek()!.width;
        tempRectangle.lastLineFirstElement = tempRectangle.upperLeftCorner;
        tryMerge();

      }
    }
    if (!foundAndMerge() && stack!.length > 0)
      tryNextDown();

  }

  void tryNextDown() {

    if (!stack!.peek()!.lastLineFirstElement
        .isNextElementDownConsecutive()) {

      // Update rectangle height
      int newHeight = stack!.peek()!.lastLineFirstElement.x
          - stack!.peek()!.upperLeftCorner.x + 1;
      stack!.peek()!.height = newHeight;
      stack!.peek()!.validated = true;
      stack!.peek()!.previousLargestArea = 0;
      mergeVertical();
      emptyStack();

    } else {
      currentPoint = stack!.peek()!.lastLineFirstElement.nextDown;
    }
  }

  void goNextElementStack() {
    if (stack!.length > 0) {
      if (yToCheck == yTotal) {
        tryNextDown();
      } else {
        tryNextRight();
      }
    } else {
      currentPoint = linkedMatrix!.getFirstElement()!;
    }
  }

  bool stackNewRectangle() {

    int currentHeight = currentPoint!.x;
    int currentWidth = currentPoint!.y;
    int height = temp1![currentHeight][currentWidth];
    int width = temp2![currentHeight][currentWidth];
    LinkedMatrixElement restart;
    xTotal = height;
    yTotal = width;
    area = width * height;
    // If point remove and go
    if (area == 1) {
      stack!.add(TemporaryRectangle(
          height, width, area, currentPoint!,
          currentPoint!, currentPoint!));

      if (stack!.length > 1) {

        if (!tryMerge())
          emptyStack();

      } else {

        removeCurrentRectangle();
      }
      return false;
    } else {

      if (yTotal == 1) {// Point de r�dem�rrage en fonction de //
        // largeur>1 ou
        // non
        restart = currentPoint!.nextDown!;
        // xToCheck--;
        // yToCheck=yTotal;
      } else {
        if (currentPoint!.isNextElementRightConsecutive())
          restart = currentPoint!.nextRight!;
        else
          restart = currentPoint!;
      }
      stack!.add(TemporaryRectangle(height, width, area, currentPoint!,
          currentPoint!, restart));
      stack!.peek()!.lastLineFirstElement = currentPoint!;

    }
    return true;
  }

  int getArea(LinkedMatrixElement point) {
    int currentHeight = point.x;
    int currentWidth = point.y;
    return (temp1![currentHeight][currentWidth] * temp2![currentHeight][currentWidth]);
  }

  void addRectangle(LinkedMatrixElement origin, int height, int width) {
    if (width * height >= MIN_AREA)
      rectangles!.add(SortableRectangle(origin.x, origin.y,
          width, height));
    linkedMatrix!.removeRectangle(origin, height, width);
  }

  bool mergeVertical() {
    if (stack!.isVerticallyMergeable()) {

      // Two becomes one
      TemporaryRectangle oldlast = stack!.poll()!;
      TemporaryRectangle newLast = stack!.peek()!;
      int maxheightOld = oldlast.upperLeftCorner.x
          + oldlast.height - 1;
      int maxheightNew = newLast.upperLeftCorner.x
          + newLast.height - 1;
      if (maxheightOld > maxheightNew) {// New greater rectangle
        newLast.height = maxheightOld
            - newLast.upperLeftCorner.x + 1;
      }
      stack!.peek()!.lastLineFirstElement = oldlast.lastLineFirstElement;

      area = newLast.area;
      // Update counters
      xTotal = newLast.height;
      // Set xTocheck from the position
      xToCheck = max(maxheightOld, maxheightNew)
          - oldlast.lastLineFirstElement.x;
      yTotal = newLast.width;
      yToCheck = yTotal;
      stack!.peek()!.validated = false;
      newLast.currentPosition = oldlast.currentPosition;
      int expectedX = newLast.upperLeftCorner.x
          + newLast.height - 1;
      int expectedY = newLast.upperLeftCorner.y
          + newLast.width - 1;

      if (xToCheck == 0
          || (expectedX == oldlast.currentPosition.x && expectedY == oldlast
              .currentPosition.y)) {
        stack!.peek()!.validated = true;
        stack!.peek()!.potentialSecondArea = 0;
        if (!newLast.lastLineFirstElement
            .isNextElementDownConsecutive()
            && !oldlast.currentPosition
                .isNextElementRightConsecutive()) {

          removeCurrentRectangle();
          return false;
        }
      }

      return true;
    } else
      return false;
  }

  bool mergeHorizontal() {

    if (stack!.isHorizontallyMergeable()) {
      // Two becomes one
      TemporaryRectangle oldlast = stack!.poll()!;
      TemporaryRectangle newLast = stack!.peek()!;
      int maxWidthOld = oldlast.upperLeftCorner.y
          + oldlast.width - 1;
      int maxWidthNew = newLast.upperLeftCorner.y
          + newLast.width - 1;
      if (maxWidthOld > maxWidthNew) {
        newLast.width = (maxWidthOld - newLast.upperLeftCorner.y + 1);
      }
      newLast.validated = false;
      area = newLast.area;
      // Update counters

      if (newLast.height > 1) {
        if (oldlast.currentPosition.x > newLast
            .currentPosition.x) {// Some
          // parts
          // of
          // the
          // old
          // have
          // not
          // been
          // validated
          newLast.currentPosition = oldlast.upperLeftCorner;
        } else
          newLast.currentPosition = oldlast.currentPosition;
      } else
        newLast.currentPosition = oldlast.currentPosition;

      updateCounterToCurrentRectangle();
      if (yToCheck == 0) {
        xToCheck--;
        if (xToCheck == 0) {
          newLast.potentialSecondArea = 0;
          newLast.validated = true;
          // Check if rectangle is to be removed
          if (!newLast.lastLineFirstElement
              .isNextElementDownConsecutive()
              && !oldlast.currentPosition.isNextElementRightConsecutive()) {

            removeCurrentRectangle();
            return false;
          }

        }

      }
      return true;
    }
    return false;
  }

  void updateCounterToCurrentRectangle() {
    TemporaryRectangle? current = stack!.peek();
    if(current == null) return;
    yTotal = current.width;
    yToCheck = current.width
        - (current.currentPosition.y
            - current.upperLeftCorner.y + 1);
    xTotal = current.height;
    xToCheck = xTotal
        - (current.currentPosition.x
            - current.upperLeftCorner.x + 1) + 1;

  }

}
