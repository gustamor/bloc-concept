abstract class CounterEvent {
  final int factor;
  CounterEvent(this.factor);
}

class Incremented extends CounterEvent{
  Incremented(super.factor);
}
class Decremented extends CounterEvent{
  Decremented(super.factor);
}