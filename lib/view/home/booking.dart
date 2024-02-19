import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/bloc/popular/bloc/popularser_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/bookingcard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/detailswidget.dart';

class Bookings extends StatelessWidget {
  const Bookings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Bookings',
          style: AppText.labeltext,
        ),
        rightText: HomeString.appName,
        
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<BookinglistBloc, BookinglistState>(
          listener: (context, state) {},
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<BookinglistBloc>()
                    .add(GetAllBookingDetailsEvent());
                context.read<PopularserBloc>().add(GetPopularServiceData());
              },
              child: state is FetchBookingLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: AppColors.whiteColor,
                    ))
                  : state is FetchBookingSuccessState &&
                          state.bookings.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            final bookings = state.bookings[index];
                            return InkWell(
                              onTap: () {
                                context
                                    .read<SavedBloc>()
                                    .add(GetSavedEvent());
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BookingDetails(
                                      servicers: bookings,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: BookingCardWidget(
                                name: bookings.username,
                                imageUrl: bookings.servicerImage,
                                jobTitle: bookings.serviceCategory,
                                location: bookings.location,
                                price:
                                    "₹ ${bookings.serviceAmount.toString()}",
                                status: bookings.status,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: state.bookings.length,
                        )
                      : Center(
                          child: SizedBox(
                            child: Text(
                              'No Bookings',
                              style: AppText.incontainer,
                            ),
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
