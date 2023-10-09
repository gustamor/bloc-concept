import '../../state_managment/cubit.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(): super(0);

  void increment() {
    emit(state + 1);
  }

}