import 'package:flutter/material.dart';
import 'package:new_app/api/ApiManager.dart';
import 'package:new_app/models/SourceResponse.dart';
import 'package:new_app/ui/home_screen/home_page/source/SourceTabs.dart';

import '../../../../utiles/AppColors.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        //this is while loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyScaleColor),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        //server response => success or error
        if (snapshot.data?.status != "ok") {
          return Center(child: Text(snapshot.data?.message ?? ""));
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
