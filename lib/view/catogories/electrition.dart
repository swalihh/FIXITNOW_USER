import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/Electrition/bloc/electrition_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/catogoriescard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';

// ignore: must_be_immutable
class Electrition extends StatelessWidget {
  Electrition({super.key});
  List<ValueNotifier<bool>> issavedList = [];

  @override
  Widget build(BuildContext context) {
    //  final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Electrition',
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
            child: BlocConsumer<ElectritionBloc, ElectritionState>(
              listener: (context, state) {
                if (state is FetchAllElectritionsDataError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is FetchAllElectritionsDataSuccess &&state.servicers.isNotEmpty) {
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
                            context.read<SavedBloc>().add(GetSavedEvent());
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ServicerBook(servicers: services,index: index),
                          ));
                        },
                      
                      );
                    },
                  );
                }
                return Center(
                            child: SizedBox(
                              child: Text(
                                'No Servicers',
                                style: AppText.incontainer,
                              ),
                            ),
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}