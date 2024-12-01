part of 'default_bloc.dart';

sealed class DefaultState extends Equatable {
  const DefaultState();
  
  @override
  List<Object> get props => [];
}

final class DefaultInitial extends DefaultState {}
