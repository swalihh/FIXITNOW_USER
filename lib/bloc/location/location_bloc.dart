

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:userapp/view/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GeoLocatorClicked>(geoLocatorClicked);

  }

  FutureOr<void> geoLocatorClicked(GeoLocatorClicked event, Emitter<LocationState> emit)async {

    Future<bool> requestLocationPermission() async {
  // Check if permission is already granted
  if (await Permission.locationWhenInUse.isGranted) {
    return true; // Permission already granted
  }

  // Request permission
  var status = await Permission.locationWhenInUse.request();

  if (status == PermissionStatus.granted) {
    return true; // Permission granted
  } else {
    return false; // Permission not granted
  }
}

await requestLocationPermission();  
emit(LocaionPickedLoading());
final  location= await LocationPickService().getCurrentLocation();
if(location.isNotEmpty){
emit(LocaionPickedSuccess(locationdata: location));
}else{
  emit(LocaionPickedFailed(message: "Location Picked Failed"));
}
  }
}


