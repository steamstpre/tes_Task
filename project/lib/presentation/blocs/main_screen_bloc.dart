import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/models/model.dart';
import 'package:project/models/show.dart';
import 'package:project/services/api/api.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  List<Model>? _data;
  List<String?> _res = [];
  final API _api = API();

  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetDataEvent>(_getDataFromApi);
    on<GetModelOfShowEvent>(_getDataFromList);
  }

  Future<void> _getDataFromApi(GetDataEvent event, emit) async {
    _data = await _api.sentRequset(event.name);
    emit(LoadingDataState());
    if (_data != null) {
      _data?.forEach(
        (element) {
          _res.add(element.show?.name);
        },
      );
      emit(GetDataState(_res));
    }
  }

  void _getDataFromList(GetModelOfShowEvent event, emit) {
    Show? res = Show();
    emit(LoadingDataState());
    _data?.forEach(
      (element) {
        if (element.show?.name == event.modelName) {
          res = element.show!;
        }
      },
    );
    emit(GetShowModelState(res!));
    // res = null;
    cleanData();
  }

  void cleanData() {
    _data = null;
    _res = [];
  }
}
