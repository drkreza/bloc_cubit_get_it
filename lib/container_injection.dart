import 'package:get_it/get_it.dart';
import 'package:my_test_bloc_cubit/cubit/counter_cubit.dart';

final sl = GetIt.instance;

Future<void> inject() async {
  sl.registerSingleton<CounterCubit>(CounterCubit());
}
