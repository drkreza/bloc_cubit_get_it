import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_test_bloc_cubit/cubit/counter_cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<CounterCubit>(context);
    final bloc = GetIt.I<CounterCubit>();

    return Scaffold(
      body: Center(
        child: Text(bloc.name),
      ),
    );
  }
}
