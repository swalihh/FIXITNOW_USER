import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/Cleaning/bloc/cleaning_bloc.dart';
import 'package:userapp/bloc/Cooking/bloc/cooking_bloc.dart';
import 'package:userapp/bloc/Electrition/bloc/electrition_bloc.dart';
import 'package:userapp/bloc/booking/booking_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/bloc/location/location_bloc.dart';
import 'package:userapp/bloc/login/login_bloc.dart';
import 'package:userapp/bloc/others/others_bloc.dart';
import 'package:userapp/bloc/painting/painting_bloc.dart';
import 'package:userapp/bloc/payment/payment_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/bloc/popular/bloc/popularser_bloc.dart';
import 'package:userapp/bloc/profileupdate/bloc/profileupdate_bloc.dart';
import 'package:userapp/bloc/razorpay/razorpay_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/bloc/search/bloc/search_bloc.dart';
import 'package:userapp/bloc/servicers/bloc/servicers_bloc.dart';
import 'package:userapp/bloc/signup/bloc/signup_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/view/home/splashscreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedprfe.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SignupBloc(),),
      BlocProvider(create: (context) => UserBloc(),),
      BlocProvider(create: (context) => LoginBloc(context.read<UserBloc>()),),
      BlocProvider(create: (context) => PlumbingBloc(),),
      BlocProvider(create: (context) => CleaningBloc(),),
      BlocProvider(create: (context) => ElectritionBloc(),),
      BlocProvider(create: (context) => PaintingBloc(),),
      BlocProvider(create: (context) => BookingBloc(),),
      BlocProvider(create: (context) => BookinglistBloc(),),
      BlocProvider(create: (context)=>ServicersBloc()),
      BlocProvider(create: (context) => SearchBloc(context.read<ServicersBloc>())),
      BlocProvider(create: (context) => SavedBloc(),),
      BlocProvider(create: (context) => PopularserBloc(),),
      BlocProvider(create: (context) => CookingBloc(),),
      BlocProvider(create: (context) => OthersBloc(),),
      BlocProvider(create: (context) => ProfileupdateBloc(),),
      BlocProvider(create: (context) => LocationBloc(),),
      BlocProvider(create: (context) => PaymentBloc(),),
       BlocProvider(create: (context) => RazorpayBloc(),),
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
