
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFieldText<T> extends StatelessWidget {

  const FormFieldText({
    super.key, 
    required this.label, 
    required this.provider,
    this.isEnabled,
    this.controller,
    this.verticalMargin = 10
  });

  static FormFieldText<String> string(
    String label, Rx<String> value, {
      RxBool? isEnabled, TextEditingController? controller, double? verticalMargin
    }
  ) {
    return FormFieldText<String>(
      label: label,
      provider: FormFieldValueProvider<String>(
        value,
        canWrite: isEnabled,
        toStringVal: (v) => v,
        fromStringVal: (v) => v,
      ),
      controller: controller,
      verticalMargin: verticalMargin,
    );
  }

  final String label;
  final FormFieldValueProvider<T> provider;
  final TextEditingController? controller;
  final RxBool? isEnabled;
  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 10),
      child: Obx(() => TextFormField(
        controller: controller,
        decoration: FormFieldDecoration.defaultDecoration(label),
        keyboardType: provider.type,
        onChanged: (v) => provider.value.value = provider.fromString(v),
        initialValue: controller != null ? null : provider.toString(),
        enabled: provider.canWrite.isTrue,
      )),
    );
  }
}

class FieldDisplay extends StatelessWidget {
  const FieldDisplay({
    required this.value, 
    required this.label,
    this.verticalMargin,
    super.key, 
  });

  final String label;
  final String value;
  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return FormFieldText.string(
      label, value.obs, isEnabled: false.obs, verticalMargin: verticalMargin
    );
  }
}

class FormFieldValueProvider<T> {
  FormFieldValueProvider(
    this.value, {
    required this.toStringVal, 
    required this.fromStringVal,
    RxBool? canWrite,
    this.type
  }) {
    this.canWrite = canWrite ?? true.obs;
  }

  final Rx<T> value;
  final TextInputType? type;
  late RxBool canWrite;
  late String Function(T) toStringVal;
  late T Function(String) fromStringVal;

  @override
  String toString() {
    return toStringVal(value.value);
  }

  T fromString(String text) {
    return fromStringVal(text);
  }
}

class FormFieldDecoration {

  static InputDecoration defaultDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: Get.textTheme.labelMedium,
      contentPadding: const EdgeInsets.all(12),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.theme.colorScheme.onSecondaryContainer,
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.theme.colorScheme.onSecondaryContainer,
        )
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.theme.colorScheme.onError,
        )
      ),
    );
  }
}