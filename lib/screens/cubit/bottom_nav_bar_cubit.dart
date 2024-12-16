import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/popular.dart';
import 'package:news_app/screens/sport.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const PopularScreen(),
    const SportScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarChange());
  }
}
