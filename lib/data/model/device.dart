import 'package:flutter/material.dart';

import '../../bridge_definitions.dart';

extension ToDisplayDeviceType on DeviceType {
  String get toText {
    const typeToString = {
      DeviceType.Bulb: "Bulb",
    };
    return typeToString[this]!;
  }

  IconData get toIconData {
    const typeToIcon = {
      DeviceType.Bulb: Icons.light
    };
    return typeToIcon[this]!;
  }
}

extension ToDisplayDeviceImpl on DeviceImpl {
  String get toText {
    const typeToString = {
      DeviceImpl.None: "",
      DeviceImpl.Yeelight: "Yeelight",
    };
    return typeToString[this]!;
  }
}

//extension TypeString on Type {
//  String get text {
//    final toStr = {
//      Type.white: "White",
//      Type.color: "Color",
//      Type.animation: "Animation"
//    };
//    return toStr[this]!;
//  }
//}
