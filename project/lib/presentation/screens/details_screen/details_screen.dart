import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/show.dart';
import 'package:project/presentation/blocs/main_screen_bloc.dart';
import 'package:project/presentation/screens/details_screen/details_view.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  Show? model = Show();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (context, state) {
        if (state is GetShowModelState) {
          model = state.model;
        }
      },
      builder: (context, state) {
        if (state is LoadingDataState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return DetailsView(model: model);
      },
    );
  }
}
