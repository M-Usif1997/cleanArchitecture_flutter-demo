part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  ErrorAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

class MesssageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  MesssageAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}
