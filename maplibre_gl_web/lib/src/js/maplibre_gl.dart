@JS('maplibregl')
library maplibre_gl_web.js.maplibre;

import 'dart:html';

import 'package:js/js.dart';

typedef TransformRequestFunction = RequestParameters? Function(
  String url,
  String /* ResourceType */ resourceType,
);

@JS()
@anonymous
class Coordinates {
  external double get lat;
  external double get lon;

  external factory Coordinates({
    required double lat,
    required double lon,
  });
}

@JS()
@anonymous
abstract class RequestParameters {
  external factory RequestParameters({
    required String url,

    /// 'same-origin' | 'include'
    String? credentials,
    Object? headers,

    /// 'GET' | 'POST' | 'PUT'
    String? method,
    bool? collectResourceTiming,
  });

  external String get url;
  external String? get credentials;
  external Map<String, dynamic>? get headers;
  external String? get method;
  external bool? collectResourceTiming;
}

@JS('Map')
class MaplibreMap {
  external MaplibreMap(MapboxOptions options);

  external void once(String type, Function listener);
  external void resize();
  external void triggerRepaint();
}

@JS()
@anonymous
abstract class MarkerOptions {
  external factory MarkerOptions({
    HtmlElement? element,
    String? anchor,
    String? color,
    int? scale,
    bool? draggable,
  });
}

@JS('Marker')
class MaplibreMarker {
  external MaplibreMarker([MarkerOptions? options]);

  external MaplibreMarker addTo(MaplibreMap map);
  external MaplibreMarker setLngLat(Coordinates coordinates);
}

@JS()
@anonymous
abstract class FitBoundsOptions {
  external factory FitBoundsOptions();
}

@JS()
@anonymous
abstract class MapboxOptions {
  external factory MapboxOptions({
    bool? antialias,
    bool? attributionControl,
    double? bearing,
    double? bearingSnap,
    Coordinates? bounds,
    bool? boxZoom,
    Coordinates? center,
    double? clickTolerance,
    bool? collectResourceTiming,
    bool? crossSourceCollisions,
    required Object /* string | HTMLElement */ container,
    List<String>? customAttribution,
    bool? dragPan,
    bool? dragRotate,
    bool? doubleClickZoom,
    bool? hash,
    int? fadeDuration,
    bool? failIfMajorPerformanceCaveat,
    FitBoundsOptions? fitBoundsOptions,
    bool? interactive,
    bool? keyboard,
    Map<String, String>? locale,
    String? localIdeographFontFamily,
    String? logoPosition,
    Coordinates? maxBounds,
    double? maxPitch,
    double? maxZoom,
    double? minPitch,
    double? minZoom,
    bool? preserveDrawingBuffer,
    double? pitch,
    bool? pitchWithRotate,
    bool? refreshExpiredTiles,
    bool? renderWorldCopies,
    bool? scrollZoom,
    String? style,
    bool? trackResize,
    TransformRequestFunction? transformRequest,
    bool? touchZoomRotate,
    bool? touchPitch,
    int? zoom,
    double? maxTileCacheSize,
    String? accessToken,
  });

  external bool? get antialias;
  external bool? get attributionControl;
  external double? get bearing;
  external double? get bearingSnap;
  external Coordinates? get bounds;
  external bool? get boxZoom;
  external Coordinates? get center;
  external double? get clickTolerance;
  external bool? get collectResourceTiming;
  external bool? get crossSourceCollisions;
  external Object /* string | HTMLElement */ get container;
  external List<String>? customAttribution;
  external bool? get dragPan;
  external bool? get dragRotate;
  external bool? get doubleClickZoom;
  external bool? get hash;
  external int? get fadeDuration;
  external bool? get failIfMajorPerformanceCaveat;
  external FitBoundsOptions? get fitBoundsOptions;
  external bool? get interactive;
  external bool? get keyboard;
  external Map<String, String>? locale;
  external String? get localIdeographFontFamily;
  external String? get logoPosition;
  external Coordinates? get maxBounds;
  external double? get maxPitch;
  external double? get maxZoom;
  external double? get minPitch;
  external double? get minZoom;
  external bool? get preserveDrawingBuffer;
  external double? get pitch;
  external bool? get pitchWithRotate;
  external bool? get refreshExpiredTiles;
  external bool? get renderWorldCopies;
  external bool? get scrollZoom;
  external String? get style;
  external bool? get trackResize;
  external TransformRequestFunction? get transformRequest;
  external bool? get touchZoomRotate;
  external bool? get touchPitch;
  external double? get zoom;
  external double? get maxTileCacheSize;
  external String? get accessToken;
}
