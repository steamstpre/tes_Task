import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/models/show.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  Show? _model;
  DetailsView({Key? key, required Show? model})
      : _model = model,
        super(key: key);

  final _snackBar = const SnackBar(
    content: Text('no follow link'),
  );

  Future<void> _launchURL(String url, BuildContext context) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                text: _model?.name != null ? _model?.name! : 'name',
                style: TextStyle(fontSize: 20.w),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          _model?.image?.medium != null
              ? SizedBox(
                  width: 350.w,
                  height: 250.h,
                  child: Image.network(
                    _model!.image!.medium as String,
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
          _model?.genres != null && _model!.genres!.isNotEmpty
              ? SizedBox(
                  height: 300.h,
                  width: 360.w,
                  child: ListView.builder(
                    itemCount: _model?.genres?.length,
                    itemBuilder: (context, index) {
                      final item = _model?.genres![index];
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
              : Container(),
          SizedBox(
            height: 10.h,
          ),
          _model?.rating?.average != null
              ? SizedBox(
                  width: 50.w,
                  height: 20.h,
                  child: RichText(
                    text: TextSpan(
                      text: _model?.rating?.average.toString(),
                      style: TextStyle(
                        fontSize: 55.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
          _model?.status != null
              ? SizedBox(
                  width: 60.w,
                  height: 30.h,
                  child: RichText(
                    text: TextSpan(
                      text: _model?.status,
                      style: TextStyle(
                        fontSize: 25.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10.h,
          ),
          _model?.officialSite != null
              ? SizedBox(
                  child: InkWell(
                    child: Text(_model?.officialSite as String),
                    onTap: () async {
                      await _launchURL(_model?.officialSite as String, context);
                    },
                  ),
                )
              : Container(),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
