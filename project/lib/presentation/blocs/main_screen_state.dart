part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class GetDataState extends MainScreenState {
  List<String?> result;

  GetDataState(this.result);
}

class GetShowModelState extends MainScreenState {
  Show model;

  GetShowModelState(this.model);
}

class LoadingDataState extends MainScreenState {}
