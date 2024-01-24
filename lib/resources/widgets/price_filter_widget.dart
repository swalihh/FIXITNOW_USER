import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class PriceFilterWidget extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final ValueNotifier<double> selectedPrice;

  const PriceFilterWidget({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Price',style: AppText.averagewhite),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ValueListenableBuilder(
                  valueListenable: selectedPrice,
                  builder: (context, value, child) => Text(selectedPrice.value.toStringAsFixed(0),style: const TextStyle(color: Colors.white),)),
            ),
            // SizedBox(height: 8.0),
            Expanded(
              flex: 9,
              child: ValueListenableBuilder<double>(
                valueListenable: selectedPrice,
                builder: (context, value, child) {
                  return Slider(
                    activeColor: AppColors.primaryColor,
                    min: minPrice,
                    max: maxPrice,
                    value: value,
                    onChanged: (newValue) {
                      selectedPrice.value = newValue;
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      selectedPrice.notifyListeners();
                    },
                  );
                },
              ),
            ),
            const Expanded(
              flex: 2,
              child: Text('₹1500',style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      ],
    );
  }
}