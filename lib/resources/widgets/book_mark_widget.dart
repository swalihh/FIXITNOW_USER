import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/models/savedmodel.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/resources/constant/colors.dart';

// ignore: must_be_immutable
class BookMarkWidget extends StatefulWidget {
  BookMarkWidget(
      {super.key, required this.serviceModel, required this.savedList});
  ServicersModel serviceModel;
  List<SavedModel> savedList;
  List<SavedModel> tempSavedModel = [];

  @override
  State<BookMarkWidget> createState() => _BookMarkWidgetState();
}

class _BookMarkWidgetState extends State<BookMarkWidget> {
  late ValueNotifier<bool> bookMarkVisibility;

  @override
  void initState() {
    super.initState();
    bookMarkVisibility = ValueNotifier<bool>(widget.savedList
        .any((element) => element.servicerId == widget.serviceModel.id));
    widget.tempSavedModel = widget.savedList.isNotEmpty
        ? widget.savedList
            .where((element) => element.servicerId == widget.serviceModel.id)
            .toList(growable: false)
        : [];


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              bookMarkVisibility.value = !bookMarkVisibility.value;
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              bookMarkVisibility.notifyListeners();
              if (bookMarkVisibility.value) {

                context
                    .read<SavedBloc>()
                    .add(AddToSavedEvent(id: widget.serviceModel.id));
              } else if (bookMarkVisibility.value == false) {

                if (widget.tempSavedModel.isEmpty) {             
                  return;
                }   
                context.read<SavedBloc>().add(RemoveFromEvent(
                    savedid: widget.tempSavedModel[0].wishlistId));
              }
            },
            child: ValueListenableBuilder(
              valueListenable: bookMarkVisibility,
              builder: (context, value, child) => value
                  ? const Icon(
                      Icons.bookmark,
                      color: AppColors.whiteColor,
                    )
                  : const Icon(
                      Icons.bookmark_border,
                      color: AppColors.whiteColor,
                    ),
            ))
      ],
    );
  }
}
