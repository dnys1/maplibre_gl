import 'package:flutter/foundation.dart';

@immutable
class Coordinates {
  final double lat;
  final double lon;

  const Coordinates({
    required this.lat,
    required this.lon,
  });
}

enum ResourceType {
  unknown,
  style,
  source,
  tile,
  glyphs,
  spriteImage,
  spriteJSON,
  image,
}

extension ResourceTypeX on ResourceType {
  String get value {
    final _value = toString().split('.')[1];
    return _value[0].toUpperCase() + _value.substring(1);
  }

  static ResourceType fromString(String resourceType) =>
      ResourceType.values.firstWhere((el) => el.value == resourceType);
}

typedef TransformRequestFunction = Map<String, dynamic>? Function(
  String url,
  ResourceType resourceType,
);
