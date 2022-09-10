import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlanWidget extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  const PlanWidget(
      {Key? key, required this.androidBuilder, required this.iosBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
