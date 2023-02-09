import 'package:project/presentation/blocs/main_screen_bloc.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  final MainScreenBloc bloc = MainScreenBloc();

  void setupGetIt() {
    GetIt.instance.registerSingleton(bloc);
  }
}