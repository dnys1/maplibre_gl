import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

// This counter is used to provide a stable "constant" initialization id
// to the buildView function, so the web implementation can use it as a
// cache key. This needs to be provided from the outside, because web
// views seem to re-render much more often that mobile platform views.
int _nextMapCreationId = 0;

class MaplibreMap extends StatefulWidget {
  const MaplibreMap({
    Key? key,
    this.center,
    this.zoom,
    this.style,
    this.transformRequestFunction,
  }) : super(key: key);

  final Coordinates? center;
  final int? zoom;
  final String? style;
  final TransformRequestFunction? transformRequestFunction;

  @override
  State<MaplibreMap> createState() => _MaplibreMapState();
}

class _MaplibreMapState extends State<MaplibreMap> {
  final _mapId = _nextMapCreationId++;
  late final MaplibreGlController _controller;

  @override
  Widget build(BuildContext context) {
    return MaplibreGlPlatform.instance.buildView(
      _mapId,
      onPlatformViewCreated,
      center: widget.center,
      transformRequestFunction: widget.transformRequestFunction,
      zoom: widget.zoom,
      style: widget.style,
    );
  }

  void onPlatformViewCreated(int id) {
    // Rebuild once the map has been drawn.
    _controller = MaplibreGlPlatform.instance.getController(id);
    if (widget.center != null) {
      _controller.addMarker(widget.center!);
    }
    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   SchedulerBinding.instance!.addPostFrameCallback((_) {
    //     setState(() {
    //       _controller.resize();
    //     });
    //   });
    // });
  }
}
