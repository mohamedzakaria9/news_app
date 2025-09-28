import 'package:flutter/material.dart';
import 'package:new_app/models/SourceResponse.dart';
import 'package:new_app/ui/home_screen/home_page/news/NewsWidget.dart';
import 'package:new_app/ui/home_screen/home_page/source/SourceName.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
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
          SizedBox(
            height: height * 0.76,
            child: BlocProvider(
              create: (context) => NewsWidgetCubit(),
              child: NewsWidget(source: widget.sourcesList[selectedIndex]),
            ),
          ),
        ],
      ),
    );
  }
}
