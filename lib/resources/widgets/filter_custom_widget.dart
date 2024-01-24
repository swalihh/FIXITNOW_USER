import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/search/bloc/search_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/check_box_widget.dart';
import 'package:userapp/resources/widgets/custom_button_for_filter.dart';
import 'price_filter_widget.dart';

// ignore: must_be_immutable
class SearchFilterWidget extends StatelessWidget {
  SearchFilterWidget(
      {super.key,
      required this.queryNotifier,
      required this.categories,
      required this.containerVisiblity,
      required this.selectedPrice});
  ValueNotifier<List<String>> categories;

  ValueNotifier<double> selectedPrice;
  ValueNotifier<bool> containerVisiblity;
  ValueNotifier<String> queryNotifier;

  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: containerVisiblity,
      builder: (context, value, child) => AnimatedContainer(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(7)),
        duration: const Duration(seconds: 0),
        height: containerVisiblity.value ? 280 : 0,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('Category',style: AppText.averagewhite,),
                 CheckBoxWidget(filterList:categories ),
                  const SizedBox(
                    height: 8,
                  ),
                  PriceFilterWidget(
                    maxPrice: 1500,
                    minPrice: 100,
                    selectedPrice: selectedPrice,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: queryNotifier,
                        builder: (context, value, child) =>
                            CustomButtonForCouponApplyType(
                                text: 'Apply',
                                color: AppColors.primaryColor,
                                onPressedFunction: () {
                                  containerVisiblity.value =
                                      !containerVisiblity.value;

                                  context.read<SearchBloc>().add(
                                      SearchServicersEvent(
                                          query: value,
                                          servicersList: categories.value,
                                          priceRange: selectedPrice.value));
                                }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}