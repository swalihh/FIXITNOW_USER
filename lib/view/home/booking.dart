import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/bookingcard.dart';

import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/detailswidget.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Bookings',
            style: AppText.labeltext,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: BlocConsumer<BookinglistBloc, BookinglistState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FetchBookingSuccessState &&
                  state.bookings.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final bookings = state.bookings[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BookingDetails(servicers: bookings),
                          ));
                        },
                        child: BookingCardWidget(
                          name: bookings.username,
                          imageUrl: bookings.servicerImage,
                          jobTitle: bookings.serviceCategory,
                          location: bookings.location,
                          price: bookings.serviceAmount.toString(),
                          status: bookings.status,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.bookings.length);
              }
              return Center(
                  child: SizedBox(
                child: Text(
                  'No Bookings',
                  style: AppText.incontainer,
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
