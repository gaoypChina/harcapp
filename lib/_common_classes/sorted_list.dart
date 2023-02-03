import 'dart:math' as math;

import 'package:collection/collection.dart';

/// A list capable of keeping itself sorted according to its compare function
///
/// Because [Comparable.compare] takes non-nullable parameters, you must define a custom `compare` function or use [SortedList.nullable] to use a list that can hold null items
class SortedList<E> extends DelegatingList<E> {
  Comparator<E> _compare;

  /// The comparator of this [SortedList]
  ///
  /// This function determines the order of the items
  /// inside this [SortedList]. Setting it will reorder the list
  /// according to its new [compare] function
  Comparator<E> get compare => _compare;
  set compare(Comparator<E> value) {
    _compare = value;
    super.sort(_compare);
  }

  /// Creates a list that keeps itself sorted.
  ///
  /// [compare] is used to determine the sort order of the elements.
  /// The [Comparable.compare] function is used by default.
  SortedList([Comparator<E>? compare])
      : _compare = compare ?? Comparable.compare as Comparator<E>,
        super(<E>[]);

  /// Creates a [SortedList] that contains all the elements of [elements]
  ///
  /// [compare] is used to determine the sort order of the elements, if [null], [Comparable.compare] is used
  factory SortedList.from({
    required Iterable<E> elements,
    Comparator<E>? compare,
  }) =>
      SortedList(compare)..addAll(elements);

  /// Creates a [SortedList] with a default comparator that handles null items.
  ///
  /// [nullLast] is used to define how the default [compare] function should behave
  ///
  /// The use of this constructor is recommended if this [SortedList] can contain nullable elements, since [Comparable.compare] does not accept nullable arguments
  ///
  ///
  /// Example:
  ///
  ///     // Sorts null items at first place
  ///     final sortedList = SortedList<int>.nullable(
  ///       nullLast: false,
  ///       elements: [10, null, 2, 7],
  ///     );
  ///     print(sortedList); // [null, 2, 7, 10]
  factory SortedList.nullable({
    bool nullLast = true,
    Iterable<E>? elements,
  }) {
    final defaultA = nullLast ? 1 : -1;
    final defaultB = nullLast ? -1 : 1;
    int nullableComparator(E a, E b) {
      if (a == null && b == null) return 0;
      if (a == null) return defaultA;
      if (b == null) return defaultB;
      return (a as Comparable).compareTo(b);
    }

    final sortedList = SortedList(nullableComparator);
    if (elements != null) sortedList.addAll(elements);
    return sortedList;
  }

  /// Finds the index where [value] should be inserted
  int _findInsertionIndex(E value) {
    if (length == 0) return 0;
    var start = 0;
    var end = length;
    var index = 0;
    while (start < end) {
      final mid = start + ((end - start) >> 1);

      // The element at the middle of the list
      final element = this[mid];

      // The result of the comparison of the objects
      final comp = _compare(element, value);
      if (comp == 0) return mid;
      // [value] is greater than [element]
      if (comp < 0) {
        start = mid + 1;
        index = start;
      }
      // [value] is smaller than [element]
      else {
        end = mid;
        index = end;
      }
    }
    return index;
  }

  /// Adds [value] to the list, extending the length by one.
  ///
  ///     SortedList<int> values = SortedList<int>();
  ///     values.add(6);
  ///     values.add(2);
  ///     values.add(10);
  ///     print(values); // [2, 6, 10]
  ///
  /// If you want to insert a large amount of items, consider using [addAll]:
  ///
  ///     Sorted<int> values = SortedList<int>();
  ///     values.addAll(myVeryLongList);
  ///
  @override
  void add(E value) {
    final index = _findInsertionIndex(value);
    super.insert(index, value);
  }

  /// Adds all objects of [iterable] to this list.
  ///
  /// Extends the length of the list by the number of objects in [iterable].
  ///
  /// Its more efficient than calling [add] multiple times for large amounts of items.
  @override
  void addAll(Iterable<E> iterable) {
    super.addAll(iterable);
    super.sort(_compare);
  }

  /// Returns true if this list contains an element equal to [element]
  ///
  /// This operation will make a binary search to check if [element] is in this list.
  ///
  /// The equality used to determine whether [element] is equal to an element of
  /// the iterable is defined by the [compare] function of this list
  @override
  bool contains(Object? element) {
    if (element is E) {
      return binarySearch(this, element, compare: _compare) != -1;
    } else {
      return super.contains(element);
    }
  }

  /// Returns the first index of [element] in this list.
  ///
  /// Searches the list from index [start] to the end of the list.
  /// The first time an object [:o:] is encountered so that [compare(o, element) == 0],
  /// the index of [:o:] is returned.
  ///
  ///     SortedList<String> values = SortedList<String>();
  ///     values.addAll(['foo', 'bar', 'baz', 'foo', 'bar']);
  ///     print(values); // [bar, bar, baz, foo, foo]
  ///     print(values.indexOf('foo')); // 3
  ///     print(values.indexOf('foo', 4)); // 4
  ///
  /// Returns -1 if [element] is not found.
  ///
  ///     values.indexOf('something');    // -1
  ///
  @override
  int indexOf(E element, [int start = 0]) {
    var min = math.min(start, length - 1);
    var max = length;
    // optimization for best case scenario
    if (_compare(this[min], element) == 0) return min;
    var found = false;
    // Custom implementation of binary search to find the first index of an element
    while (min < max) {
      final mid = min + ((max - min) >> 1);
      final comp = _compare(this[mid], element);
      found = found || comp == 0;
      if (comp < 0) {
        min = mid + 1;
      } else {
        max = mid;
      }
    }
    return found ? min : -1;
  }

  /// Returns the last index of [element] in this list.
  ///
  /// Searches the list from index 0 to [end].
  ///
  /// The first time an object [:o:] is encountered so that [:compare(:o:, element):],
  /// the index of [:o:] is returned.
  ///
  ///     SortedList<String> values = SortedList<String>();
  ///     values.addAll(['foo', 'bar', 'baz', 'foo', 'bar']);
  ///     print(values.lastIndexOf('bar')); // 1
  ///
  /// If [end] is not provided, this method searches from the end of the
  /// list.
  ///
  ///     print(values.lastIndexOf('baz'));  // 4
  ///
  /// Returns -1 if [element] is not found.
  ///
  ///     values.lastIndexOf('something');  // -1
  @override
  int lastIndexOf(E element, [int? end]) {
    var min = 0;
    var max = math.min(end ?? length, length);
    // optimization for best case scenario
    if (max < length && _compare(this[max], element) == 0) return max;
    var found = false;
    // Custom implementation of binary search to find the last index of an element
    while (min < max) {
      final mid = min + ((max - min) >> 1);
      final comp = _compare(this[mid], element);
      found = found || comp == 0;
      if (comp > 0) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    return found ? max - 1 : -1;
  }

  /// Returns the concatenation of this list and [other].
  ///
  /// Returns a new list containing the elements of this list with
  /// the elements of [other], all sorted.
  @override
  List<E> operator +(List<E> other) {
    final returnList = super + other;
    returnList.sort(_compare);
    return returnList;
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the Add method.')
  @override
  void insert(int index, E element) {
    throw UnsupportedError(
        'Cannot insert element at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the AddAll method.')
  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(
        'Cannot insert multiple elements at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the Add method.')
  @override
  void operator []=(int index, E value) {
    throw UnsupportedError(
        'Cannot modify element at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the AddAll method.')
  @override
  void setAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(
        'Cannot modify multiple elements at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the AddAll method.')
  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw UnsupportedError(
        'Cannot modify multiple elements at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the AddAll method.')
  @override
  void fillRange(int start, int end, [E? fillValue]) {
    throw UnsupportedError(
        'Cannot modify multiple elements at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not necessary, the list already auto sorts itself. The `compare` parameter will not be used if this method is called, instead will be used the `compareFunction`, which was passed to the constructor as a parameter.')
  @override
  void sort([int Function(E a, E b)? compare]) {
    super.sort(_compare);
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered, consider using the removeRange method with the AddAll method.')
  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw UnsupportedError(
        'Cannot modify multiple elements at a specific position in a sorted list.');
  }

  @Deprecated(
      'This method is not supported since it does not allow the list to stay ordered.')
  @override
  void shuffle([math.Random? random]) {
    throw UnsupportedError('Cannot shuffle elements in a sorted list.');
  }
}