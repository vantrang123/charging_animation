// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter_template_rxdart/core/shared/loading_widget.dart' as _i3;
import 'package:flutter_template_rxdart/models/image_model/image_model.dart'
    as _i7;
import 'package:flutter_template_rxdart/pages/charging_animation/charging_animation_page.dart'
    as _i1;
import 'package:flutter_template_rxdart/pages/charging_animation/widgets/item_animation_page.dart'
    as _i2;
import 'package:flutter_template_rxdart/pages/splash/splash_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ChargingAnimationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.ChargingAnimationPage()),
      );
    },
    ItemAnimationRoute.name: (routeData) {
      final args = routeData.argsAs<ItemAnimationRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ItemAnimationPage(
          key: args.key,
          itemAnimation: args.itemAnimation,
          batteryPercent: args.batteryPercent,
          addEffect: args.addEffect,
          isOpenInShotCut: args.isOpenInShotCut,
          toggleOnScreen: args.toggleOnScreen,
          tapOnScreen: args.tapOnScreen,
        ),
      );
    },
    LoadingWidget.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoadingWidget(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChargingAnimationPage]
class ChargingAnimationRoute extends _i5.PageRouteInfo<void> {
  const ChargingAnimationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ChargingAnimationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChargingAnimationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ItemAnimationPage]
class ItemAnimationRoute extends _i5.PageRouteInfo<ItemAnimationRouteArgs> {
  ItemAnimationRoute({
    _i6.Key? key,
    required _i7.ImageModel itemAnimation,
    required int batteryPercent,
    Function? addEffect,
    bool? isOpenInShotCut,
    bool? toggleOnScreen,
    Function? tapOnScreen,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ItemAnimationRoute.name,
          args: ItemAnimationRouteArgs(
            key: key,
            itemAnimation: itemAnimation,
            batteryPercent: batteryPercent,
            addEffect: addEffect,
            isOpenInShotCut: isOpenInShotCut,
            toggleOnScreen: toggleOnScreen,
            tapOnScreen: tapOnScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemAnimationRoute';

  static const _i5.PageInfo<ItemAnimationRouteArgs> page =
      _i5.PageInfo<ItemAnimationRouteArgs>(name);
}

class ItemAnimationRouteArgs {
  const ItemAnimationRouteArgs({
    this.key,
    required this.itemAnimation,
    required this.batteryPercent,
    this.addEffect,
    this.isOpenInShotCut,
    this.toggleOnScreen,
    this.tapOnScreen,
  });

  final _i6.Key? key;

  final _i7.ImageModel itemAnimation;

  final int batteryPercent;

  final Function? addEffect;

  final bool? isOpenInShotCut;

  final bool? toggleOnScreen;

  final Function? tapOnScreen;

  @override
  String toString() {
    return 'ItemAnimationRouteArgs{key: $key, itemAnimation: $itemAnimation, batteryPercent: $batteryPercent, addEffect: $addEffect, isOpenInShotCut: $isOpenInShotCut, toggleOnScreen: $toggleOnScreen, tapOnScreen: $tapOnScreen}';
  }
}

/// generated route for
/// [_i3.LoadingWidget]
class LoadingWidget extends _i5.PageRouteInfo<void> {
  const LoadingWidget({List<_i5.PageRouteInfo>? children})
      : super(
          LoadingWidget.name,
          initialChildren: children,
        );

  static const String name = 'LoadingWidget';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
