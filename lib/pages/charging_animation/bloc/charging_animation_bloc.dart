import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_rxdart/core/utils/helpers/dp_disposable.dart';
import 'package:flutter_template_rxdart/models/image_model/image_model.dart';
import 'package:flutter_template_rxdart/pages/charging_animation/bloc/charging_animation_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

class ChargingAnimationBloc extends Cubit<ChargingAnimationState>
    with DPDisposable {
  final battery = Battery();
  final _getBatteryLevel = PublishSubject<void>();
  final percentBattery = BehaviorSubject<int>.seeded(0);
  final saveItemAnimation = BehaviorSubject<ImageModel>();
  final tapOnScreen = BehaviorSubject<bool>.seeded(false);

  final listModelAnimation = BehaviorSubject<List<ImageModel>>.seeded([
    const ImageModel(
      id: 0,
      image: 'assets/images/image_1.png',
      video: "assets/video/video_2.mp4",
      type: "dart",
    ),
    const ImageModel(
        id: 1,
        image: 'assets/images/image_2.png',
        video: "assets/video/video_1.mp4",
        type: "light"),
  ]);

  ChargingAnimationBloc() : super(ChargingAnimationInitial()) {
    handleNativeAction();
    replayGetBatteryLevel();
    _getBatteryLevel.asyncMap((_) => getBatteryPercent()).doOnError((p0, _) {
      emit(ChargingAnimationError(p0));
    }).listen((event) {
      percentBattery.add(event);
      emit(ChargingAnimationSuccess());
    }).canceledBy(this);

    tapOnScreen.listen((value) {
      debugPrint("Tap on screen");
      debugPrint("value");
      emit(TapOnItemAnimationPage(value));
    }).canceledBy(this);
  }

  Future<int> getBatteryPercent() async => await battery.batteryLevel;

  void replayGetBatteryLevel() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _getBatteryLevel.add(null);
    });
  }

  static const MethodChannel _channel =
      MethodChannel('battery_animation.flutter/shortcuts');

  Future<void> handleNativeAction() async {
    try {
      _channel.setMethodCallHandler((call) async {
        if (call.method == "handleOpenAppFromShortcut") {
          debugPrint("Flutter receive Shortcut action");
          if (saveItemAnimation.hasValue) {
            emit(OpenAppFromShotcuts());
            debugPrint("Emit ChargingAnimationSuccess");
          }
        }
      });
    } on PlatformException catch (e) {
      emit(ChargingAnimationError(e));
    }
  }
}
