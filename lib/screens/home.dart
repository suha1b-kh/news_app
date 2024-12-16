import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/cubit/bottom_nav_bar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text(
                'News App',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // body: ConditionalBuilder(
            //   condition: true,
            //   builder: (context) => screens[0],
            //   fallback: (context) => const CircularProgressIndicator(),
            // ),
            body: BottomNavBarCubit.get(context)
                .screens[BottomNavBarCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
              ],
              currentIndex: BottomNavBarCubit.get(context).currentIndex,
              onTap: (index) {
                BottomNavBarCubit.get(context).changeIndex(index);

                log(BottomNavBarCubit.get(context).currentIndex.toString());

                // setState(() {
                //   log(currentIndex.toString());
                // });
              },
            ),
          );
        },
      ),
    );
  }
}
