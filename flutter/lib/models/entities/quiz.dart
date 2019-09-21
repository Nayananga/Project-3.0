import 'package:meta/meta.dart';

import 'entities.dart';

class Quiz {
  final WidgetData correct;

  final List<WidgetData> candidates;
  Quiz({
    @required this.correct,
    @required List<WidgetData> others,
  }) : candidates = others
          ..add(correct)
          ..shuffle();
}
