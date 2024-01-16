// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/Cooking/bloc/cooking_bloc.dart';
import 'package:userapp/bloc/Electrition/bloc/electrition_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/bloc/others/others_bloc.dart';
import 'package:userapp/bloc/painting/painting_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/bloc/popular/bloc/popularser_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/bloc/servicers/bloc/servicers_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/view/home/bottomnavigaton.dart';
import 'package:userapp/view/signup/opening.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    _validation(context);
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }

  _validation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    final id = Sharedprfe.instance.getstorage();
    if (id != null) {
      context.read<PlumbingBloc>().add(PlumberDetailsFetchEvent());
      context.read<ElectritionBloc>().add(GetAllElectritonsEvent());
      context.read<CookingBloc>().add(FetchAllCookingDataEvent());
      context.read<OthersBloc>().add(GetOtherServicersEvent());
      context.read<BookinglistBloc>().add(GetAllBookingDetailsEvent());
      context.read<PaintingBloc>().add(GetAllPainterEvent());
      context.read<SavedBloc>().add(GetSavedEvent());
      context.read<PopularserBloc>().add(GetPopularServiceData());
      context.read<UserBloc>().add(UserDataFetchEvent());
      context.read<ServicersBloc>().add(FetchAllServicersEvent());

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Start(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Opening(),
      ));
    }
  }
}
