import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class Progress extends StatelessWidget {
  const Progress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return SizedBox(
      height: 44,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: model.progress.map((kind) {
            return Text(_convertToStringFromProgressKind(kind));
          }).toList(),
        ),
      ),
    );
  }

  String _convertToStringFromProgressKind(ProgressKind kind) {
    switch (kind) {
      case ProgressKind.already:
        return '⭕️️️';
      // case ProgressKind.incorrect: //skip option
      //   return '❌';
      case ProgressKind.notYet:
        return '▫️';
      case ProgressKind.current:
        return '🔷';
    }
    assert(false, 'invalid kind: $kind');
    return '';
  }
}
