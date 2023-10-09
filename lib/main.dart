import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_test_bloc_cubit/container_injection.dart';
import 'package:my_test_bloc_cubit/cubit/counter_cubit.dart';
import 'package:my_test_bloc_cubit/pages/second_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  /*   return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    ); */
       return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<CounterCubit>(context);
    // final bloc = context.watch<CounterCubit>();
    final bloc = GetIt.I<CounterCubit>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<CounterCubit, CounterState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is CounterLoaded) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }
              },
              child: BlocBuilder<CounterCubit, CounterState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is CounterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CounterLoaded) {
                    return Center(child: Text(state.myModel.name));
                  } else {
                    return const Text('Please be patient ... ');
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  bloc.fetchData();
                },
                child: const Text('Click Me !'))
          ],
        ),
      ),
    );
  }
}
