import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounter extends StatelessWidget {
  const CubitCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

///
/// [_CubitCounterView]
class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter ${value.state.transactionCount + 1}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('Estado cambia');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(3);
            },
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(1);
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
