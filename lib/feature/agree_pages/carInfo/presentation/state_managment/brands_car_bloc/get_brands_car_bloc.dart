import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/get_all_brands.dart';

part 'get_brands_car_event.dart';
part 'get_brands_car_state.dart';

class GetBrandsCarBloc extends Bloc<GetBrandsCarEvent, GetBrandsCarState> {
  final GetAllBrandsUseCase getBrandsCarUseCase;

  GetBrandsCarBloc({required this.getBrandsCarUseCase})
      : super(GetBrandsCarInitial()) {
    on<FetchBrandsCar>((event, emit) async {
      emit(GetBrandsCarLoading());

      final result = await getBrandsCarUseCase();

      result.fold(
        (failure) {
          emit(GetBrandsCarFailure(_mapFailureToMessage(failure)));
        },
        (brandsList) {
          emit(GetBrandsCarSuccess(brandsList));
        },
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoConnectionFailure) {
      return StringManager.noInternetConnection;
    } else {
      return failure.message;
    }
  }
}
