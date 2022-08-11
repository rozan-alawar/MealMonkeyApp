import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../widgets/app_bar.dart';

class ChangAddress extends StatelessWidget {
  ChangAddress({Key? key}) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(31.403256, 34.370157));

  static const CameraPosition targetPosition =
      CameraPosition(target: LatLng(31.501668, 34.434504));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) => _controller.complete(controller),
      ),
    );
  }

  PreferredSize _appbar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 70.h),
      child: const MyAppBar(title: 'Change Address', haveLeading: true),
    );
  }
}
