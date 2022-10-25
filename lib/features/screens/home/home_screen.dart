import 'package:bloc_builder/core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CounterCubit cubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
              bloc: cubit,
              buildWhen: (previous, current) {
                if (current >= 5) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: ((context, state) {
                return Center(
                  child: Text(
                    '$state',
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              })),

          // StreamBuilder(
          //     stream: cubit.stream,
          //     builder: ((context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: Text(
          //             'Loading....',
          //             style: TextStyle(fontSize: 40),
          //           ),
          //         );
          //       } else {
          //         return Center(
          //           child: Text('${snapshot.data}', style: const TextStyle(fontSize: 50),),
          //         );
          //       }
          //     })),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => cubit.decrement(),
                icon: const Icon(
                  Icons.remove,
                  size: 35,
                  color: Colors.amber,
                ),
              ),
              IconButton(
                onPressed: () => cubit.increment(),
                icon: const Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
