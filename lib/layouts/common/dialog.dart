import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:yeelight_panel/common/primary_button.dart';

class DialogWrapper<T> {
  final Widget dialog;

  DialogWrapper(this.dialog);

  Future<T?> open(BuildContext context) {
    return Get.dialog<T>(dialog);
  }
}


class InputDialog extends StatelessWidget {

  final BuildContext parentContext;
  final void Function(BuildContext) confirm;
  final String title;
  final String confirmLabel;
  final Widget formBody;
  final Rx<DialogHeaderProvider?>? headerProvider;
  final RxBool? isEnabled;

  static final RxBool isEnabledDummy = true.obs;

  const InputDialog({
    super.key, 
    required this.parentContext, 
    required this.confirm, 
    required this.title, 
    required this.confirmLabel, 
    required this.formBody,
    this.isEnabled,
    this.headerProvider,
  });

  Widget getInnerContainer({required Widget child, required Color color}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      boxShadow: const [BoxShadow(
        color: Colors.black38,
        blurRadius: 3,
        spreadRadius: 4
      )],
    ),
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    final txtTheme = Get.textTheme;
    final colors = Get.theme.colorScheme;

    const borderColor = Color.fromARGB(238, 18, 18, 18);
    return AlertDialog(
      backgroundColor: Get.theme.colorScheme.onPrimaryContainer,
      surfaceTintColor: Colors.transparent,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16
      ),
      insetPadding: const EdgeInsets.symmetric(vertical: 24),
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 24
      ),
      shape: const RoundedRectangleShapeBorder(
        borderRadius: DynamicBorderRadius.all(DynamicRadius.circular(Length(6))),
        borderSides: RectangleBorderSides.all(DynamicBorderSide(
          color: borderColor,
          width: 6
        ))
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10
        ),
        decoration: const BoxDecoration(
          color: borderColor,
        ),
        child: Text(title, style: txtTheme.bodyMedium),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Offstage(
            offstage: headerProvider?.value == null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: getInnerContainer(
                color: headerProvider?.value?.backgroundColor ?? Colors.black,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8
                  ),
                  child: Text(headerProvider?.value?.message ?? "")
                ),
              ),
            ),
          )),
          getInnerContainer(
            color: colors.onTertiaryContainer,
            child: formBody,
          ),
        ]
      ),
      actions: [
        PrimaryButton(
          icon: const Icon(Icons.add), 
          label: Text(confirmLabel), 
          size: ButtonSize.small,
          onPressed: (_) => confirm(parentContext),
          isEnabled: isEnabled ?? isEnabledDummy,
        ),
        PrimaryButton(
          icon: const Icon(Icons.close), 
          label: const Text("Cancel"), 
          size: ButtonSize.small,
          onPressed: (_) => Get.back(),
          isEnabled: isEnabled ?? isEnabledDummy,
        ),
      ],
    );
  }
}

class DialogHeaderProvider {
  final String message;
  final Color backgroundColor;

  const DialogHeaderProvider({this.message = "", this.backgroundColor = Colors.black});
}


class ThemeColors {

  ThemeColors(final BuildContext context);

  Color infoColor() => const Color.fromARGB(255, 82, 114, 125);

  Color errorColor() => const Color.fromARGB(255, 141, 58, 72);

  Color highlightTintColor(int alpha) => Color.fromARGB(alpha, 15, 131, 203);
  
  Color highlightBorderTintColor() => const Color.fromARGB(255, 78, 152, 198);
}