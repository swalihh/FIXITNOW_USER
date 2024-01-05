import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/search/bloc/search_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/bookingcard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        //  rightText: HomeString.appName,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Search here',
          style: AppText.labeltext,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.maxFinite,
                color: AppColors.backgroundColor,
                child: TextFormField(
                  onChanged: (value) {
                    context.read<SearchBloc>().add(GetAllServicersEvent(value: value));
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      hintText: 'Search for  Services',
                      hintStyle: AppText.xSmall),
                ),
              ),
            ),
            Expanded(child:
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              if (state is GetSearchSuccessState &&state.servicersFilterdList.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final serchresult = state.servicersFilterdList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServicerBook(servicers: serchresult),));
                        },
                        child: BookingCardWidget(
                          
                          imageUrl: serchresult.servicerImage,
                          jobTitle:serchresult.serviceCategory,
                          location: serchresult.location,
                          name: serchresult.username,
                          price: serchresult.amount.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: state.servicersFilterdList.length);
              }
              return SizedBox(
                child: Center(child: Text('Not found',style: AppText.incontainer,)),
              );
            }))
          ],
        ),
      ),
    );
  }
}
