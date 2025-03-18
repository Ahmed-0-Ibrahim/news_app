import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/search/search.dart';
import '../../modules/setting/setting.dart';
import '../../modules/sports/sports.dart';
import '../../shared/Componenet/component.dart';
import '../../shared/Cubit/cubit.dart';
import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> screens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  List<String> categories = const [
    'business',
    'sports',
    'science',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          actions: [
            IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).changeDarkOrLightMode();
                },
                icon: const Icon(Icons.brightness_4_outlined)),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: (){
        //     NewsCubit.get(context).changeDarkOrLightMode();
        //   },
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_baseball),
              label: "Sports",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.science),
              label: "Science",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
          currentIndex: NewsCubit.get(context).currentIndex,
          onTap: (index) {
            NewsCubit.get(context).changeCurrentIndex(index);
            if (index < 3) {
              NewsCubit.get(context).changeCategory(categories[index]);
            }
          },
        ),
        body: screens[NewsCubit.get(context).currentIndex],
      ),
    );
  }
}
