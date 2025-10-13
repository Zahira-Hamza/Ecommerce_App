part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTabInitial extends HomeTabState {}

class CategoryLoading extends HomeTabState {}

class CategoryLoaded extends HomeTabState {
  List<Category> categoriesList;
  CategoryLoaded({required this.categoriesList});
}

class CategoryError extends HomeTabState {
  String Message;
  CategoryError({required this.Message});
}

//===============brands state====================
class BrandLoading extends HomeTabState {}

class BrandLoaded extends HomeTabState {
  List<Brand> brandsList;
  BrandLoaded({required this.brandsList});
}

class BrandError extends HomeTabState {
  String Message;
  BrandError({required this.Message});
}

//!!!!uniting the success state for the both apis to prevent if one api did work the other will not working it will be in loading state
class HomeTabLoaded extends HomeTabState {
  final List<Category>? categoriesList;
  final List<Brand>? brandsList;
  HomeTabLoaded({this.categoriesList, this.brandsList});
  HomeTabLoaded copyWith(
      {List<Category>? categoriesList, List<Brand>? brandsList}) {
    return HomeTabLoaded(
        categoriesList: categoriesList ?? this.categoriesList,
        brandsList: brandsList ?? this.brandsList);
  }
}
