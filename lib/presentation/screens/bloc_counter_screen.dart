import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/bloc/counter_bloc/counter_bloc_bloc.dart';

class BlocCounter extends StatelessWidget {
  const BlocCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBlocBloc(),
      child: const _CounterBlocView(),
    );
  }
}

class _CounterBlocView extends StatelessWidget {
  const _CounterBlocView();

  void increaseValueBy(BuildContext context, [int value = 1]) {
    context.read<CounterBlocBloc>().add(CounterIncreased(value));
  }

  void resetValue(BuildContext context) {
    context.read<CounterBlocBloc>().add(const CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBlocBloc value) =>
            Text('Bloc Counter ${value.state.transactionCounter}')),
        actions: [
          IconButton(
              onPressed: () {
                resetValue(context);
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBlocBloc value) =>
            Text('Counter value: ${value.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              increaseValueBy(context, 3);
            },
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              increaseValueBy(context, 2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              increaseValueBy(context);
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
