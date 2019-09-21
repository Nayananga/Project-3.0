import 'package:meta/meta.dart';

class WidgetData {
  final String name;

  final String description;

  final String link;
  WidgetData({
    @required this.name,
    @required this.description,
    @required this.link,
  });
  WidgetData.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        description = json['description'] as String,
        link = json['link'] as String;
}
