import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/catogoriescard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/saved/job_detail_forsaved.dart';
import 'package:userapp/resources/widgets/saved/savedview.dart';


class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        rightText: HomeString.appName,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Saved',
          style: AppText.labeltext,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<SavedBloc, SavedState>(
          builder: (context, state) {
            if (state is GetSavedEmptyState) {
              Center(
                  child: SizedBox(
                child: Text(
                  'Saved is Empty',
                  style: AppText.incontainer,
                ),
              ));
            }
            if (state is GetSavedDataSuccessState &&state.savedList.isNotEmpty) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final saved = state.savedList[index];

                    return CategoriesCard(
                       onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                         return  Savedview(servicers: saved,index: index,);
                        },));
                       },
                      amount: saved.amount.toString(),
                      imageUrl: saved.servicerImage,
                      jobName: saved.serviceCategory,
                      name: saved.fullname,
                      dynamicWidgets: [
                        InkWell(
                            onTap: () {
                              context.read<SavedBloc>().add(
                                  RemoveFromEvent(savedid: saved.wishlistId));
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ))
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: state.savedList.length);
            }
            return Center(
                child: SizedBox(
              child: Text(
                'Saved is Empty',
                style: AppText.incontainer,
              ),
            ));
          },
        ),
      ),
    );
  }
}
