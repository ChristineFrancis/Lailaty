part of 'get_brands_car_bloc.dart';

abstract class GetBrandsCarState extends Equatable {
  const GetBrandsCarState();

  @override
  List<Object> get props => [];
}

// initial
class GetBrandsCarInitial extends GetBrandsCarState {}

// loading
class GetBrandsCarLoading extends GetBrandsCarState {}

// success
class GetBrandsCarSuccess extends GetBrandsCarState {
  final List<BrandsCarEntity> brands;

  const GetBrandsCarSuccess(this.brands);

  @override
  List<Object> get props => [brands];
}

// failure
class GetBrandsCarFailure extends GetBrandsCarState {
  final String errorMessage;

  const GetBrandsCarFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
