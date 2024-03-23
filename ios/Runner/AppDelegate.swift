
import UIKit
import Flutter

var batteryChannel: FlutterMethodChannel!

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        batteryChannel = FlutterMethodChannel(
            name: "battery_animation.flutter/shortcuts",
            binaryMessenger: controller.binaryMessenger
        )
        batteryChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          // This method is invoked on the UI thread.
          guard call.method == "getBatteryLevel" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.receiveBatteryLevel(result: result)
        })

        if #available(iOS 16.0, *) {
            ShortcutProvider.updateAppShortcutParameters()
        } else {
            // Fallback on earlier versions
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        return result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        return result(Int(device.batteryLevel * 100))
      }
    }
}

import Intents
import AppIntents

@available(iOS 16, *)
struct OpenFavorites: AppIntent {
    /// Every intent needs to include metadata, such as a localized title. The title of the intent is displayed throughout the system.
    static var title: LocalizedStringResource = "Open Battery Animations"


    /// An intent can optionally provide a localized description that the Shortcuts app displays.
    static var description = IntentDescription("Opens battery animation while charging")


    /// Tell the system to bring the app to the foreground when the intent runs.
    static var openAppWhenRun: Bool = true


    /**
     When the system runs the intent, it calls `perform()`.

     Intents run on an arbitrary queue. Intents that manipulate UI need to annotate `perform()` with `@MainActor`
     so that the UI operations run on the main actor.
     */
    @MainActor
    func perform() async throws -> some IntentResult {
//        navigationModel.selectedCollection = trailManager.favoritesCollection
        print("openChargingAnimation")
        batteryChannel.invokeMethod("handleOpenAppFromShortcut", arguments: nil)
        /// Return an empty result, indicating that the intent is complete.
        return .result()
    }
}

@available(iOS 16.0, *)
struct ShortcutProvider: AppShortcutsProvider {
    static let appShortcut = AppShortcut(intent: OpenFavorites(), phrases: [
        "Open Favorites in \(.applicationName)",
        "Show my favorite \(.applicationName)"
    ],
                                         shortTitle: "Open Favorites",
                                         systemImageName: "star.circle"
    )
    static var appShortcuts: [AppShortcut] = []
}
