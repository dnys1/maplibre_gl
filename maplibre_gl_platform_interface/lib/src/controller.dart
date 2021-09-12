import 'package:maplibre_gl_platform_interface/maplibre_gl_platform_interface.dart';

abstract class MaplibreGlController {
  const MaplibreGlController._();

  void resize();
  void addMarker(Coordinates coordinates);
  void setCenter(Coordinates coordinates);
}
