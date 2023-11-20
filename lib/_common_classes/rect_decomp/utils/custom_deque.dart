class CustomDeque<E>{

	final List<E> _list;

	int i;
	
	CustomDeque(this.i): _list = [];

	E? peek() {
		if (length == 0)
			return null;
		return _list[length - 1];
	}

	E? poll() {
		if (length == 0)
			return null;
		E val = _list[length - 1];
		_list.removeAt(length - 1);
		return val;
	}

	E? peekSecondLast() {
		if (length < 2)
			return null;
		return _list[length - 2];
	}

	void add(E value) => _list.add(value);

  int get length => _list.length;

  E operator [](int index) => _list[index];

  void operator []=(int index, E value) => _list[index] = value;

}
