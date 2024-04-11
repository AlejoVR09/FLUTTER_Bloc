import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(const CounterBlocState(counter: 7)) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(
      CounterIncreased event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCounter: state.transactionCounter + 1,
    ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
