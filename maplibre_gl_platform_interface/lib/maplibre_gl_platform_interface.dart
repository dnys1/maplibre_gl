import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maplibre_gl_platform_interface/src/controller.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/types.dart';

export 'src/types.dart';
export 'src/controller.dart';

abstract class MaplibreGlPlatform extends PlatformInterface {
  MaplibreGlPlatform() : super(token: _token);

  static final Object _token = Object();

  static late MaplibreGlPlatform _instance;

  /// The default instance of [MaplibreGlPlatform] to use.
  static MaplibreGlPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MaplibreGlPlatform] when they register themselves.
  static set instance(MaplibreGlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Widget buildView(
    int creationId,
    PlatformViewCreatedCallback onPlatformViewCreated, {
    Coordinates? center,
    TransformRequestFunction? transformRequestFunction,
    int? zoom,
    String? style,
  }) {
    throw UnimplementedError('buildView() has not been implemented.');
  }

  MaplibreGlController getController(int mapId) {
    throw UnimplementedError('getController() has not been implemented.');
  }
}
