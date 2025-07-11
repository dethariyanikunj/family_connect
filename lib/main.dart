import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import './firebase_options.dart';
import './localizations/languages.dart';
import './utils/app_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Google Fonts Licence
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Theme
  AppThemeUtils().setLightStatusBarStyle();

  // Network
  ConnectivityManager.instance.setConnectivityListener();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase Initialize Error: $e');
  }

  // Ref. https://firebase.google.com/docs/crashlytics/get-started?platform=flutter
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // App transition config
  Get.config(
    defaultTransition: Transition.fadeIn,
    defaultDurationTransition: const Duration(milliseconds: 100),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConfig.figmaScreenSize,
      builder: (context, widget) {
        return ToastificationWrapper(
          config: const ToastificationConfig(
            itemWidth: double.infinity,
          ),
          child: Obx(() {
            // Check connectivity state
            if (!ConnectivityManager.instance.isNetConnected.value) {
              // Show No Internet Screen if disconnected
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (Get.currentRoute != AppRoutes.noInternetPage) {
                  Get.toNamed(
                    AppRoutes.noInternetPage,
                    preventDuplicates: true,
                  );
                }
              });
            } else {
              // Close No Internet Screen when connected
              if (Get.currentRoute == AppRoutes.noInternetPage) {
                Get.back();
              }
            }
            return _materialAppWidget();
          }),
        );
      },
    );
  }

  Widget _materialAppWidget() {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: ThemeData(
        textTheme: AppTextStyle.getTextTheme(),
        primarySwatch: AppColors.primaryPalette,
        scaffoldBackgroundColor: AppColors.colorWhite,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashPage,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
