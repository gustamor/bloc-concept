import 'dart:async';

import 'package:bloc_concept/pages/bloc/counter_events.dart';
import 'package:bloc_concept/state_managment/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState){
    on<Incremented>(_onIncremented);
    on<Decremented>(_onDecremented);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(Decremented(1));
    });
  }

  Timer? _timer;

  void _onIncremented(Incremented event, Emitter<int> emit) {
      emit(state + event.factor);
  }
  void _onDecremented(Decremented event, Emitter<int> emit) {
    emit(state - event.factor);
  }

  @override
  FutureOr<void> dispose(){
    _timer?.cancel();
     super.dispose();
   }
  }

