import 'package:flutter/material.dart';
import 'package:playground/ui/tvViewModel/tv_view_model.dart';

class TVProvider extends InheritedWidget {
  final TVViewModel viewModel;

  const TVProvider({Key? key, required this.viewModel, required Widget child})
      : super(key: key, child: child);

  static TVProvider of(BuildContext context) {
    final TVProvider? result =
        context.dependOnInheritedWidgetOfExactType<TVProvider>();
    assert(result != null, 'No TV');
    return result!;
  }

  @override
  bool updateShouldNotify(TVProvider oldWidget) {
    return true;
  }
}
