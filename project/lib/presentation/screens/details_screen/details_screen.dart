import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:project/models/show.dart';
import 'package:project/presentation/blocs/main_screen_bloc.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  Show? model = Show();
  final _bloc = GetIt.instance<MainScreenBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (context, state) {
        if (state is GetShowModelState) {
          model = state.model;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 375.w,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: model?.name != null ? model?.name! : 'name',
                    style: TextStyle(fontSize: 20.w),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              model?.image?.medium != null
                  ? SizedBox(
                      width: 350.w,
                      height: 250.h,
                      child: Image.network(
                        model!.image!.medium as String,
                      ),
                    )
                  : SizedBox(
                      child: RichText(
                        text: const TextSpan(text: 'no img'),
                      ),
                    ),
              SizedBox(
                height: 30.h,
              ),
              model?.genres != null
                  ? SizedBox(
                      height: 400.h,
                      width: 360.w,
                      child: ListView.builder(
                        itemCount: model?.genres?.length,
                        itemBuilder: (context, index) {
                          final item = model?.genres![index];
                          return SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: ListTile(
                              title: Text(
                                item!,
                                style: TextStyle(
                                  fontSize: 55.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              model?.rating?.average != null
                  ? SizedBox(
                      width: 50.w,
                      height: 20.h,
                      child: RichText(
                        text: TextSpan(
                          text: model?.rating?.average.toString(),
                          style: TextStyle(
                            fontSize: 55.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              model?.status != null
                  ? SizedBox(
                      width: 50.w,
                      height: 20.h,
                      child: RichText(
                        text: TextSpan(
                          text: model?.status,
                          style: TextStyle(
                            fontSize: 25.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
