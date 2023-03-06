import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yeelight_panel/data/model/base.dart';

class Profile<T extends ProfileType<T>> with Clonable<Profile<T>>, Data<Profile<T>> {
  @override
  final String id;
  final String name;
  final ProfileDetails<T> config;
  
  Profile({
    required this.id,
    required this.name,
    required this.config,
  });
  
  @override
  Profile<T> clone() => Profile(id: id, name: name, config: config.clone());
}

class ProfileDetails<T extends ProfileType<T>> with Clonable<ProfileDetails<T>> {
  final Type type;
  final T data;

  ProfileDetails({
    required this.type,
    required this.data,
  });
  
  @override
  ProfileDetails<T> clone() => ProfileDetails(
    type: type,
    data: data.clone(),
  );
  
}

enum Type {
  white,
  color,
  animation,
}

extension TypeString on Type {
  String get text {
    final toStr = {
      Type.white: "White",
      Type.color: "Color",
      Type.animation: "Animation"
    };
    return toStr[this]!;
  }
}

abstract class ProfileType<T extends ProfileType<T>> with Clonable<T>{
  abstract final Type type;
  
}