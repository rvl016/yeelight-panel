// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_menu.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ControlMenuPanelMatch on ControlMenuPanel {
  T match<T>(
      {required T Function() white,
      required T Function() colorWheel,
      required T Function() colorFlow,
      required T Function() animated,
      required T Function() streamed}) {
    final v = this;
    if (v == ControlMenuPanel.white) {
      return white();
    }

    if (v == ControlMenuPanel.colorWheel) {
      return colorWheel();
    }

    if (v == ControlMenuPanel.colorFlow) {
      return colorFlow();
    }

    if (v == ControlMenuPanel.animated) {
      return animated();
    }

    if (v == ControlMenuPanel.streamed) {
      return streamed();
    }

    throw Exception('ControlMenuPanel.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? white,
      T Function()? colorWheel,
      T Function()? colorFlow,
      T Function()? animated,
      T Function()? streamed}) {
    final v = this;
    if (v == ControlMenuPanel.white && white != null) {
      return white();
    }

    if (v == ControlMenuPanel.colorWheel && colorWheel != null) {
      return colorWheel();
    }

    if (v == ControlMenuPanel.colorFlow && colorFlow != null) {
      return colorFlow();
    }

    if (v == ControlMenuPanel.animated && animated != null) {
      return animated();
    }

    if (v == ControlMenuPanel.streamed && streamed != null) {
      return streamed();
    }

    return any();
  }
}
