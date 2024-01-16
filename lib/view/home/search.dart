import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/search/bloc/search_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/bookingcard.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/filter_custom_widget.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';

class SearchPage extends StatelessWidget {
  ValueNotifier<bool> filterVisibility = ValueNotifier(false);
  // final List<RoomsModel> totalRooms;

  final TextEditingController searchController = TextEditingController();

  ValueNotifier<List<String>> catogories = ValueNotifier([]);


  ValueNotifier<String> queryNotifier = ValueNotifier('');

  ValueNotifier<double> selectedPrice = ValueNotifier(15000);

  // List<RoomsModel>? filteredRooms;

  // final List<String> items = ['Ac', 'Swimming Pool', 'Meeting Room', 'Wifi'];


  SearchPage({super.key});

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
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                      height: 50,
                      width: double.maxFinite,
                      color: AppColors.backgroundColor,
                      child: TextFormField(
                        style: AppText.labeltext,
                        onChanged: (value) {
                          queryNotifier.value=value;
                         context.read<SearchBloc>().add(SearchServicersEvent(query: value, servicersList: catogories.value, priceRange: selectedPrice.value));
                        },
                        decoration: InputDecoration(
                          
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            hintText: 'Search for  Services',
                            hintStyle: AppText.xSmall),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      filterVisibility.value = !filterVisibility.value;
                      filterVisibility.notifyListeners();
                    },
                    child: Container(
                      height: 50,
                      color: AppColors.backgroundColor,
                      child: const Icon(
                        Icons.tune,
                        size: 30,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: filterVisibility,
              builder: (context, value, child) {
                return SearchFilterWidget(categories: catogories,containerVisiblity: filterVisibility,queryNotifier: queryNotifier,selectedPrice: selectedPrice,);
                
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child:
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              if (state is SearchFoundState) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final serchresult = state.filteredServicers[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ServicerBook(servicers: serchresult,index: index),
                          ));
                        },
                        child: BookingCardWidget(
                          imageUrl: serchresult.servicerImage,
                          jobTitle: serchresult.serviceCategory,
                          location: serchresult.location,
                          name: serchresult.username,
                          price: serchresult.amount.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: state.filteredServicers.length);
              }
              if(state is SearchNotFoundState){
                  return SizedBox(
                child: Center(
                    child: Text(
                  'Not found',
                  style: AppText.incontainer,
                )),
              );
              }
              return const SizedBox(
               
              );
            }))
          ],
        ),
      ),
    );
  }
}
