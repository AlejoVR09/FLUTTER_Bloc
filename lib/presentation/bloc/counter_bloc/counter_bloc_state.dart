part of 'counter_bloc_bloc.dart';

class CounterBlocState extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterBlocState({this.counter = 10, this.transactionCounter = 0});

  copyWith({
    final int? counter,
    final int? transactionCounter,
  }) =>
      CounterBlocState(
        counter: counter ?? this.counter,
        transactionCounter: transactionCounter ?? this.transactionCounter,
      );

  @override
  List<Object> get props => [counter, transactionCounter];
}
