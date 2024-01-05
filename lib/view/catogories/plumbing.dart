import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/catogoriescard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';

// ignore: must_be_immutable
class Plumbing extends StatelessWidget {
  Plumbing({super.key});
  List<ValueNotifier<bool>> issavedList = [];

  @override
  Widget build(BuildContext context) {
    //  final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Plumbing',
            style: AppText.labeltext,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: BlocListener<SavedBloc, SavedState>(
            listener: (context, state) {
              if (state is SavedDataSuccessState) {
                context.read<SavedBloc>().add(GetSavedEvent());
              }
            },
            child: BlocConsumer<PlumbingBloc, PlumbingState>(
              listener: (context, state) {
                if (state is PlumberDatafetchErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is PlumberDatafetchSuccessState) {
                  return ListView.separated(
                    itemCount: state.servicers.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      final services = state.servicers[index];

                      if (issavedList.length <= index) {
                        issavedList.add(ValueNotifier(false));
                      }

                      return CategoriesCard(
                        amount: '₹ ${state.servicers[index].amount.toString()}',
                        imageUrl: state.servicers[index].servicerImage,
                        jobName: state.servicers[index].serviceCategory,
                        name: state.servicers[index].username,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ServicerBook(servicers: services),
                          ));
                        },
                        dynamicWidgets: [
                          InkWell(
                            onTap: () {
                              issavedList[index].value =
                                  !issavedList[index].value;
                              if (issavedList[index].value) {
                                context
                                    .read<SavedBloc>()
                                    .add(AddToSavedEvent(id: services.id));
                               
                              } else {}
                            },
                            child: ValueListenableBuilder(
                              valueListenable: issavedList[index],
                              builder: (context, value, child) => Icon(
                                issavedList[index].value
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_outlined,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
