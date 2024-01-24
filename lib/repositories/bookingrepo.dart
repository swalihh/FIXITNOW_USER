import 'package:userapp/data/network/apiservices.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/resources/appurls/appurls.dart';

class BookingRepo {
  final userId = Sharedprfe.instance.getstorage();

  EitherResponse getAllBookings() async {
    const url = AppUrl.getbooking;
    return await ApiServices.getApi(url + userId.toString());
  }

  EitherResponse saveservicer(serviceid) async {
    return await ApiServices.savedpostApi(
        '${AppUrl.saveddata}user_id=$userId&servicer_id=$serviceid');
  }

  EitherResponse removeServicer(savedid) async {
    return await ApiServices.saveddeleteApi(
        AppUrl.removeSaved + savedid.toString());
  }

  EitherResponse getSaved() async {
    return await ApiServices.getApi(AppUrl.getSaved + userId.toString());
  }

  EitherResponse getPopular() async {
    const url = AppUrl.popularService;
    return await ApiServices.getApi(url + userId.toString());
  }

  EitherResponse getElectritions() async {
    return await ApiServices.getApi(AppUrl.getElectritions);
  }

  EitherResponse getpaintings() async {
    return await ApiServices.getApi(AppUrl.getpainting);
  }

  EitherResponse getcleaning() async {
    return await ApiServices.getApi(AppUrl.getcleaning);
  }

  EitherResponse getcooking() async {
    return await ApiServices.getApi(AppUrl.getcooking);
  }

  EitherResponse getothers() async {
    return await ApiServices.getApi(AppUrl.getothers);
  }

  EitherResponse updateProfile(var rawData) async {
    return await ApiServices.putApi(
        AppUrl.updateProfile + userId.toString(), rawData);
  }

  EitherResponse getAllServicers() async {
    return await ApiServices.getApi(AppUrl.getAllservicers);
  }

  EitherResponse getPaymentData(bookingId) async{
  return await ApiServices.getApi("${AppUrl.getPaymentData}user_id=$userId&booking_id=$bookingId");
}
}
