import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark();
    return GetMaterialApp(
      title: 'Flutter Demo',
      darkTheme: theme.copyWith(
        useMaterial3: true,
        colorScheme: theme.colorScheme.copyWith(
          brightness: Brightness.dark,
          background: Colors.black87,
          primary: Colors.white,
          onPrimary: Colors.cyan,
          primaryContainer: Colors.black38,
          onPrimaryContainer: const Color.fromARGB(255, 55, 54, 52),
          secondary: Colors.white70,
          onSecondary: Colors.white,
          onSecondaryContainer: const Color.fromARGB(255, 96, 98, 99),
          tertiaryContainer: const Color.fromARGB(255, 176, 167, 167),
          onTertiaryContainer: const Color.fromARGB(255, 38, 36, 36),
          onBackground: const Color.fromARGB(200, 66, 64, 62),
          secondaryContainer: Colors.black45,
          error: Colors.white70,
          onError: Colors.red,
          errorContainer: Colors.redAccent,
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: Get.theme.textTheme.bodyLarge,
          actionsPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),

        ),
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        defaultScale: false,
        defaultScaleFactor: 1.6354,
        background: Container(color: const Color(0xFFF5F5F5))
      ),
      //builder: (BuildContext context, Widget? child) {
      //  final MediaQueryData data = MediaQuery.of(context);
      //  return MediaQuery(
      //    data: data.copyWith(
      //      textScaleFactor: data.textScaleFactor * 1.6354,
      //      devicePixelRatio: data.devicePixelRatio,
      //    ),
      //    child: child!,
      //  );
      //},
      themeMode: ThemeMode.system,
      home: const Root(),
    );
  }
}
