import 'package:flutter/material.dart';
import 'package:new_app/models/SourceResponse.dart';
import 'package:new_app/ui/home_screen/home_page/news/NewsWidget.dart';
import 'package:new_app/ui/home_screen/home_page/source/SourceName.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/utiles/AppFonts.dart';

import '../../../../utiles/AppColors.dart';
import '../news/cubit/news_widget_cubit.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: height*0.01,),
            Row(
              children: [
                SizedBox(width: width*0.04,),
                Text("Latest",style: AppFonts.bold16Black,),
                Spacer(flex: 1,),
                Text("See all",style: AppFonts.small14GreyScale,),
                SizedBox(width: width*0.04,),
              ],
            ),
            SizedBox(height: height*0.01,),
            TabBar(
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.mainColor,
              dividerColor: AppColors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: widget.sourcesList.map((e) {
                return SourceName(
                  source: e,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                );
              }).toList(),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => NewsWidgetCubit(),
                child: NewsWidget(source: widget.sourcesList[selectedIndex]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
