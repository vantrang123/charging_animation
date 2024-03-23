import 'dart:math';

import 'package:flutter_template_rxdart/generated/di/di.dart';
import 'package:flutter_template_rxdart/routes/router.dart';
import 'package:flutter_template_rxdart/routes/router.gr.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadingHelper {
  int _counting = 0;
  AppRouter get router => getIt<AppRouter>();

  void showLoading() {
    if (_counting == 0) router.push(const LoadingWidget());
    _counting += 1;
  }

  void hideLoading() {
    _counting = max(_counting - 1, 0);
    if (_counting == 0) {
      router.removeWhere((route) => route.name == LoadingWidget.name);
    }
  }

  void removeLoading() {
    router.removeWhere((route) => route.name == LoadingWidget.name);
    _counting = 0;
  }
}
