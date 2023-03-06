
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.onPressed,
    required this.icon,
    this.size = ButtonSize.normal,
    this.label,
    double marginRight = 0,
    double marginLeft = 0,
    double marginTop = 0,
    double marginBottom = 0,
    RxBool? isEnabled,
    super.key,
  }) : margin = EdgeInsets.only(
    left: marginLeft,
    right: marginRight,
    top: marginTop,
    bottom: marginBottom
  ), isEnabled = isEnabled ?? true.obs;

  final Icon icon;
  final Text? label;
  final ButtonSize size;
  final Function(BuildContext) onPressed;
  final EdgeInsets margin;
  final RxBool isEnabled;

  @override
  Widget build(BuildContext context) {
    final sizeProv = ButtonSizeProvider(size);
    final colors = Get.theme.colorScheme;
    final style = ButtonStyle(
      backgroundColor:  MaterialStatePropertyAll(colors.onTertiaryContainer),
      fixedSize: MaterialStatePropertyAll(sizeProv.size),
      foregroundColor: MaterialStatePropertyAll(colors.onSecondary),
      iconSize: MaterialStatePropertyAll(sizeProv.iconSize),
      textStyle: MaterialStatePropertyAll(sizeProv.textStyle),
      overlayColor: const MaterialStatePropertyAll(Color.fromARGB(5, 255, 255, 255)),
      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            color: colors.onTertiaryContainer,
            width: 2
          ), 
          borderRadius: const BorderRadius.all(Radius.elliptical(6, 5))
        )
      )
    );

    return Obx(() => Container(
      margin: margin,
      child: label == null 
        ? ElevatedButton(
            style: style,
            onPressed: isEnabled.isFalse ? null : () => onPressed(context), 
            child: icon,
          )
        : ElevatedButton.icon(
            style: style,
            onPressed: isEnabled.isFalse ? null : () => onPressed(context), 
            icon: icon, 
            label: label!,
          ),
    ));
  }
}

enum ButtonSize {
  small,
  normal,
  large
}

class ButtonSizeProvider {
  final ButtonSize _size;

  static final Map<ButtonSize, double> toSize = Map.from({
    ButtonSize.large: 30.0,
    ButtonSize.normal: 20.0,
    ButtonSize.small: 15.0,
  });

  static final Map<ButtonSize, double> toIconSize = Map.from({
    ButtonSize.large: 27.0,
    ButtonSize.normal: 18.0,
    ButtonSize.small: 15.0,
  });

  static final Map<ButtonSize, TextStyle> toTextStyle = Map.from({
    ButtonSize.large: Get.textTheme.headlineLarge,
    ButtonSize.normal: Get.textTheme.labelLarge,
    ButtonSize.small: Get.textTheme.labelMedium,
  });

  const ButtonSizeProvider(this._size);

  Size get size => Size.fromHeight(toSize[_size]! * Get.pixelRatio);

  double get iconSize => toIconSize[_size]!;

  TextStyle get textStyle => toTextStyle[_size]!;
}