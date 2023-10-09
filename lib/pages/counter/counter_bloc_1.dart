import 'dart:async';

import 'package:flutter/material.dart';

abstract class CounterEvent{
  final int factor;
  CounterEvent(this.factor);
}

class Incremented extends CounterEvent{
  Incremented(super.factor);
}
class Decremented extends CounterEvent{
  Decremented(super.factor);
}

class CounterBloc {
  int _counter = 0;

  int get counter => _counter;

  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;

  void add(CounterEvent event) {
    if (event is Incremented){
        _emit(_counter + event.factor);
    } else if (event is Decremented){
      _emit(_counter - event.factor);
    }

  }

  void _emit(int newCounter){
    if(newCounter != _counter){
      _counter = newCounter;
      _controller.add(newCounter);
    }
  }

  void dispose() {
    _controller.close();
  }
}
