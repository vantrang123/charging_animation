import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template_rxdart/generated/codegen_loader.g.dart';
import 'package:flutter_template_rxdart/generated/di/di.dart';
import 'package:flutter_template_rxdart/root/app.dart';

Future<void> main() async {
  await _setup();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('vi', 'VI'),
    ],
    path: 'assets/locales',
    fallbackLocale: const Locale('en', 'US'),
    saveLocale: true,
    assetLoader: const CodegenLoader(),
    useOnlyLangCode: true,
    child: const App(),
  ));
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
}
