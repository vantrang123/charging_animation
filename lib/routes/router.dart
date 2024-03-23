import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template_rxdart/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
@lazySingleton
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: ChargingAnimationRoute.page),
        AutoRoute(page: ItemAnimationRoute.page),
        CustomRoute(
          page: LoadingWidget.page,
          customRouteBuilder: _modalSheetBuilder,
        )
      ];
}

Route<T> _modalSheetBuilder<T>(
    BuildContext context, Widget child, Page<T> page) {
  return ModalBottomSheetRoute(
    useSafeArea: true,
    builder: (context) => child,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    modalBarrierColor: Colors.transparent,
    enableDrag: true,
    settings: page,
    isScrollControlled: true,
  );
}
