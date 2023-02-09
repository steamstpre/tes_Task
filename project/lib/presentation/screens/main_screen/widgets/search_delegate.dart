import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/presentation/blocs/main_screen_bloc.dart';
import 'package:project/presentation/screens/details_screen/details_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  final _bloc = GetIt.instance<MainScreenBloc>();
  @override
  Widget buildResults(BuildContext context) {
    _bloc.add(GetModelOfShowEvent(query));
    return DetailsScreen();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.clear),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String?> res = [];
    _bloc.add(GetDataEvent(query));

    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (context, state) {
        if (state is GetDataState) {
          res = state.result;
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: res.length,
          itemBuilder: (context, index) {
            final itemText = res[index];
            return ListTile(
              title: Text(itemText!),
              onTap: () {
                query = itemText;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}