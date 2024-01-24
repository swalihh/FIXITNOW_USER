import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/booking/booking_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/models/savedmodel.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/customtextfield.dart';
import 'package:userapp/resources/widgets/descriptiontextfield.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/Customsnackbar.dart';
import 'package:userapp/utils/calender.dart';
import 'package:userapp/utils/validations.dart';
import 'package:userapp/view/home/bottomnavigaton.dart';
import 'package:intl/intl.dart';

class AdressTakingSaved extends StatefulWidget {
  const AdressTakingSaved({Key? key, required this.servicers}) : super(key: key);
  final SavedModel servicers;

  @override
  // ignore: library_private_types_in_public_api
  _AdressTakingState createState() => _AdressTakingState();
}

class _AdressTakingState extends State<AdressTakingSaved> {
  final TextEditingController houseController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> bookingKey = GlobalKey<FormState>();

  dynamic selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Add Location',
          style: AppText.labeltext.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: bookingKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpTextField(
                  validator: (p0) => Validations.isEmpty(p0, 'House name'),
                  controller: houseController,
                  hintText: 'House no, Building Name',
                  hintStyle: AppText.smallabeltext,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  validator: (p0) => Validations.isEmpty(p0, 'City'),
                  controller: cityController,
                  hintText: 'City',
                  hintStyle: AppText.smallabeltext,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  validator: (p0) => Validations.isEmpty(p0, 'Road'),
                  controller: roadController,
                  hintText: 'Road',
                  hintStyle: AppText.smallabeltext,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  validator: (p0) => Validations.isNumber(p0, 'Phone'),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone',
                  hintStyle: AppText.smallabeltext,
                ),
                const TextFieldSpacing(),
                CalendarPicker(
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
              

                    });
                  },
                ),
                const TextFieldSpacing(),
                DescriptionTextField(
                  validator: (p0) => Validations.isEmpty(p0, 'Description'),
                  controller: descriptionController,
                  maxLines: 3,
                  hintText: 'Describe issue',
                ),
                const TextFieldSpacingBig(),
                BlocConsumer<BookingBloc, BookingState>(
                  listener: (context, state) {
                    if(state is ServiceBookingSuccessState){
                  CustomSnackBar.showCustomSnackBar(context, 'Successfully Booked');

                     context.read<BookinglistBloc>().add(GetAllBookingDetailsEvent());

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Start(),));
                    }else if(state is ServiceBookingErrorState){
                    } 
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed: () {
                        validations();
                      },
                      buttonText: 'Book Now',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validations() {

    if (bookingKey.currentState!.validate()) {
      Map<String, dynamic> useraddress = {
        "buildingname": houseController.text,
        "city": cityController.text,
        "road": roadController.text,
        "phone": phoneController.text,
        "date": formatDate(selectedDate),
        "time": '',
        "description": descriptionController.text,
        "servicerid": widget.servicers.servicerId,
        "serviceamount": 1200
      };
      context.read<BookingBloc>().add(ServiceBookEvent(map: useraddress));
    }
  }
  String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd'); // Customize the format as needed
  return formatter.format(date).toString();
}
}
