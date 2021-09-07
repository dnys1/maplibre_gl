import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:maplibre_gl_platform_interface/maplibre_gl_platform_interface.dart'
    hide MaplibreGlController;

import 'maplibre_gl_controller.dart';

/// A web implementation of the MaplibreGl plugin.
class MaplibreGlPlugin extends MaplibreGlPlatform {
  /// Registers this class as the default instance of [MaplibreGlPlatform].
  static void registerWith(Registrar registrar) {
    MaplibreGlPlatform.instance = MaplibreGlPlugin();
  }

  // A cache of map controllers by map Id.
  final _mapById = <int, MaplibreGlController>{};

  @override
  Widget buildView(
    int creationId,
    PlatformViewCreatedCallback onPlatformViewCreated, {
    Coordinates? center,
    TransformRequestFunction? transformRequestFunction,
    int? zoom,
    String? style,
  }) {
    if (_mapById[creationId] != null) {
      return _mapById[creationId]!.widget;
    }

    final controller = MaplibreGlController(
      mapId: creationId,
      center: center,
      transformRequestFunction: transformRequestFunction,
      zoom: zoom,
      style: style,
    );
    _mapById[creationId] = controller;

    onPlatformViewCreated(creationId);

    return controller.widget;
  }

  @override
  MaplibreGlController getController(int mapId) {
    if (!_mapById.containsKey(mapId)) {
      throw StateError('No map found for id $mapId');
    }
    return _mapById[mapId]!;
  }
}
