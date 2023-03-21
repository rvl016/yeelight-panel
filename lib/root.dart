import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'ffi.dart' if (dart.library.html) '../ffi_web.dart';
import 'layouts/root_layout.dart';

class Root extends StatelessWidget {
  
  Root({super.key}) {
    appState = AppState.build(modelState).obs;
  }

  late Rx<AppState> appState;
  final Rx<ModelState> modelState = ModelState().obs;

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(create: (_) => modelState),
        Provider(create: (_) => appState),
      ],
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onBackground,
            border: Border.all(
              color: Get.theme.colorScheme.onPrimaryContainer,
              width: 2
            )
          ),
          child: _Root(key: key),
        ),
      ),
    );
  }
}


class _Root extends StatelessWidget {
  const _Root({super.key});

  @override
  Widget build(BuildContext context) {
    final modelState = context.watch<Rx<ModelState>>();
    return Obx(() {
      if (modelState.value.isReady.isTrue) {
        final source = modelState.value.dataSource;
        return ProxyProvider0(
          update: (context, value) => source,
          child: const MainLayout()
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

}