import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:maplibre_gl_platform_interface/maplibre_gl_platform_interface.dart'
    as p;

import 'shims/dart_ui.dart' as ui;

import 'js/maplibre_gl.dart' as js;

class MaplibreGlController implements p.MaplibreGlController {
  final int _mapId;

  late js.MaplibreMap _map;
  late HtmlElement _div;

  String _getViewType(int mapId) => 'com.maplibre_gl_$mapId';

  HtmlElementView? _widget;
  Widget get widget {
    return _widget ??= HtmlElementView(viewType: _getViewType(_mapId));
  }

  final p.TransformRequestFunction? _transformRequestFunction;

  MaplibreGlController({
    required int mapId,
    p.Coordinates? center,
    String? style,
    int? zoom,
    p.TransformRequestFunction? transformRequestFunction,
  })  : _mapId = mapId,
        _transformRequestFunction = transformRequestFunction {
    _div = DivElement()
      ..style.width = '100%'
      ..style.height = '100%';
    _map = js.MaplibreMap(
      js.MapboxOptions(
        container: _div,
        center: center == null
            ? null
            : js.Coordinates(lat: center.lat, lon: center.lon),
        style: style,
        zoom: zoom,
        transformRequest: allowInterop(_transformRequest),
      ),
    );
    _map.once('load', allowInteropCaptureThis(($this, event) {
      $this.resize();
    }));

    ui.platformViewRegistry.registerViewFactory(
      _getViewType(mapId),
      (viewId) => _div,
    );
  }

  js.RequestParameters? _transformRequest(String url, String resourceType) {
    if (_transformRequestFunction == null) {
      return null;
    }
    final params = _transformRequestFunction!(
      url,
      p.ResourceTypeX.fromString(resourceType),
    );
    if (params == null) {
      return null;
    }
    return js.RequestParameters(
      url: params['url'] as String,
      credentials: params['credentials'] as String?,
      headers: jsify(params['headers'] as Map<String, dynamic>? ?? {}),
      method: params['method'] as String?,
      collectResourceTiming: params['collectResourceTiming'] as bool?,
    );
  }

  @override
  void resize() {
    _map.resize();
  }

  @override
  void addMarker(p.Coordinates coordinates) {
    js.MaplibreMarker()
        .setLngLat(js.Coordinates(lat: coordinates.lat, lon: coordinates.lon))
        .addTo(_map);
  }
}
