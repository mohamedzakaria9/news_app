import 'package:flutter/material.dart';
import 'package:new_app/models/SourceResponse.dart';

import '../../../../utiles/AppFonts.dart';

class SourceName extends StatelessWidget {
  bool isSelected;
  Source source;

  SourceName({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSelected ? AppFonts.bold16Black : AppFonts.medium16GreyScale,
    );
  }
}
