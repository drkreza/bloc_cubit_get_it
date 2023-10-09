part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {
  const CounterInitial();

  @override
  List<Object> get props => [];
}

final class CounterLoading extends CounterState {
  const CounterLoading();

  @override
  List<Object> get props => [];
}

final class CounterLoaded extends CounterState {
  final MyModel myModel;

  const CounterLoaded({required this.myModel});

  @override
  List<Object> get props => [myModel];
}

final class CounterError extends CounterState {
  final String message;

  const CounterError({required this.message});

  @override
  List<Object> get props => [message];
}
