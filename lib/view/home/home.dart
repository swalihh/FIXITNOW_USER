import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/popular/bloc/popularser_bloc.dart';
import 'package:userapp/bloc/search/bloc/search_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/catogorycontainer.dart';
import 'package:userapp/resources/widgets/popularcontainer.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';
import 'package:userapp/view/catogories/others.dart';
import 'package:userapp/view/catogories/plumbing.dart';
import 'package:userapp/view/home/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      color: AppColors.whiteColor,
                      Icons.location_city,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    Text(
                      'Kinfra calicut',
                      style: AppText.smallDark,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.4 - 20,
                    ),
                    Text(
                      HomeString.appName,
                      style: AppText.appname,
                    )
                  ],
                ),
                const TextFieldSpacing(),
                Container(
                  height: screenSize.height * 0.1 + 40,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("asset/images/4.jpg")),
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const TextFieldSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<SearchBloc>()
                            .add(GetAllServicersEvent(value: ''));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: screenSize.height * 0.05,
                        width: screenSize.width * 0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabled: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              hintText: 'Search for all Services',
                              hintStyle: AppText.averagewhite),
                        ),
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 0.1 + 10,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ));
                          },
                          icon: const Icon(
                            Icons.search_sharp,
                            color: AppColors.whiteColor,
                          )),
                    )
                  ],
                ),
                const TextFieldSpacing(),
                Text(
                  HomeString.catogories,
                  style: AppText.labeltext,
                ),
                // const TextFieldSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Categories(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Plumbing(),
                      )),
                      imagePath: "asset/images/plumb.png",
                      labelText: 'Plumbing',
                    ),
                    const Categories(
                      imagePath: "asset/images/bulbs.png",
                      labelText: 'Electrition',
                    ),
                    const Categories(
                      imagePath: "asset/images/paint.png",
                      labelText: 'Painting',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Categories(
                      imagePath: "asset/images/cleaning.png",
                      labelText: 'Cleaning',
                    ),
                    const Categories(
                      imagePath: "asset/images/cook.png",
                      labelText: 'Cooking',
                    ),
                    Categories(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Others(),
                      )),
                      imagePath: "asset/images/others.png",
                      labelText: 'Others',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HomeString.popularservice,
                      style: AppText.labeltext,
                    ),
                    TextButton(
                        onPressed: () {}, child: Text(HomeString.viewall))
                  ],
                ),

                SizedBox(
                  height: 200,
                  child: BlocConsumer<PopularserBloc, PopularserState>(
                    listener: (context, state) {
                      if(state is GetPopularServiceDataErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      if(state is GetPopularServiceDataSuccessState){
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final popularData=state.popular[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServicerBook(servicers: popularData),));
                              },
                              child:  CustomCardWidget(
                                amount: popularData.amount.toString(),
                                backgroundImageUrl:
                                    popularData.servicerImage,
                                jobName: popularData.serviceCategory,
                                name: popularData.username,
                                profileImageUrl:popularData.servicerImage
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: screenSize.width * 0.04,
                            );
                          },
                          itemCount: state.popular.length);
                      }return SizedBox();
                      
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}