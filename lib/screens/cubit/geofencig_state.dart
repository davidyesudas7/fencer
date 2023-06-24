part of 'geofencig_cubit.dart';

@immutable
abstract class GeofencigState {}

class GeofencigInitial extends GeofencigState {}

class GeofencigLoading extends GeofencigState {}

class GeofencigInside extends GeofencigState {}

class Geofencigoutside extends GeofencigState {}

class GeofencigError extends GeofencigState {
  final String errormessage;

  GeofencigError({required this.errormessage});
}
