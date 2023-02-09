part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class GetDataEvent extends MainScreenEvent{
  String name;

  GetDataEvent(this.name);
}

class GetModelOfShowEvent extends MainScreenEvent{
  String modelName;

  GetModelOfShowEvent(this.modelName);
}