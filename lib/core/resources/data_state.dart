import 'dart:io';

abstract class DataState<T> {
  final T? data;
  final Exception? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required T super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.error});
}
