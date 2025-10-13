import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../tabs/categories_tab/product_screen/product_list_screen.dart';
import '../tabs/favourite_tab/wishlist_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  //** hold data-handle logic-emit state
  int currentIndex = 0;

  //* Define all tabs
  List<Widget> tabs = [
    const HomeTab(),
    const ProductListScreen(),
    const WishlistTab(),
    const ProfileTab(),
  ];
  //* Tab change handler
  void changeTab(int index) {
    currentIndex = index;
    emit(ChangeSelectedIndex());
  }
}
