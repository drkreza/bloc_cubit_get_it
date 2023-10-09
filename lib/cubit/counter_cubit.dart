
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_test_bloc_cubit/model/my_model.dart';
import 'package:http/http.dart' as http;

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  late String name;

  CounterCubit() : super(const CounterInitial());

  void fetchData() async {
    try {
      emit(const CounterLoading());
      print("1");
      final uri = Uri.parse(
          'https://run.mocky.io/v3/3efd2595-8b92-4e56-9f2c-a658ab0b4348');
      final response = await http.get(uri);
      print("2");
      if (response.statusCode == 200) {
        print("3");
        // final res = jsonDecode(response.body);
        // print("3.1");
        final model = MyModel.fromJson(response.body);
        name = model.name;
        print("3.2  " + model.name);
        emit(CounterLoaded(myModel: model));
        print("3.3");
        // print("response ::::::  " + res);
      }
      print("4");
    } catch (e) {
      print("4.1  " + e.toString());
      emit(const CounterError(message: 'failed to fetch data'));
    }
  }
}
