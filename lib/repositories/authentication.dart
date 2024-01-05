import 'package:userapp/data/network/apiservices.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/resources/appurls/appurls.dart';

class AuthRepo {
  final userId = Sharedprfe.instance.getstorage();

  EitherResponse userSignUp(var rawdata) async {
    const url = AppUrl.userSignup;
    return await ApiServices.postApi(rawdata, url);
  }

  EitherResponse getuserDetails() async {
    const url = AppUrl.userdetails;
    return await ApiServices.getApi(url + userId.toString());
  }

  EitherResponse userLogin(var rawData) async {
    const url = AppUrl.userLogin;
    return await ApiServices.postApi(rawData, url);
  }

  EitherResponse fetchPlumber() async {
    const url = AppUrl.plumberdata;
    return await ApiServices.getApi(url);
  }

  EitherResponse bookservicer(var rawData) async {
    const url = AppUrl.booking;

    return await ApiServices.postApi(rawData, url + userId.toString());
  }
}
