abstract class AddState {}

class AddInitState extends AddState {}

class AddSuccessState extends AddState {}

class AddLoadingState extends AddState {}

class AddErrorState extends AddState {
  String error;
 AddErrorState(this.error);
}