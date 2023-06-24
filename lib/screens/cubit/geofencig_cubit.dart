import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'geofencig_state.dart';

class GeofencigCubit extends Cubit<GeofencigState> {
  GeofencigCubit() : super(GeofencigInitial());

  void startGeofencing() {
    final geofenceStream = Geolocator.getPositionStream().listen(
      (Position position) {
        final distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          9.4749534,
          76.3261213,
        );

        debugPrint(distance.toString());

        if (distance <= 200) {
          emit(GeofencigInside());
          // Perform actions when entering the geofence region
        } else {
          emit(Geofencigoutside());
          // Perform actions when exiting the geofence region
        }
      },
    );

    void stopGeofencing() {
      // Cancel the subscription to the position stream
      geofenceStream.cancel();
    }
  }
}
