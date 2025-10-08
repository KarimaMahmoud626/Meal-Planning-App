part of 'counter_cubit.dart';

@immutable
sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  @override
  List<Object?> get props => [counter];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate(super.counter);
}
