part of 'get_brands_car_bloc.dart';

abstract class GetBrandsCarEvent extends Equatable {
  const GetBrandsCarEvent();

  @override
  List<Object> get props => [];
}

class FetchBrandsCar extends GetBrandsCarEvent {}
