// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_layout.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension MenuPanelMatch on MenuPanel {
  T match<T>(
      {required T Function() controlPerDevice,
      required T Function() controlPerGroup,
      required T Function() devices}) {
    final v = this;
    if (v == MenuPanel.controlPerDevice) {
      return controlPerDevice();
    }

    if (v == MenuPanel.controlPerGroup) {
      return controlPerGroup();
    }

    if (v == MenuPanel.devices) {
      return devices();
    }

    throw Exception('MenuPanel.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? controlPerDevice,
      T Function()? controlPerGroup,
      T Function()? devices}) {
    final v = this;
    if (v == MenuPanel.controlPerDevice && controlPerDevice != null) {
      return controlPerDevice();
    }

    if (v == MenuPanel.controlPerGroup && controlPerGroup != null) {
      return controlPerGroup();
    }

    if (v == MenuPanel.devices && devices != null) {
      return devices();
    }

    return any();
  }
}
