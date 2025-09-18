import 'package:bloc/bloc.dart';
import 'package:bookia/features/person/data/model/profile_model.dart';
import 'package:bookia/features/person/data/repo/person_repo.dart';
import 'package:meta/meta.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInitial());


  getPersonData()async{
    emit(PersonLoading());
    final response=await PersonRepo.getPerson();
    if(response is ProfileModel){
      emit(PersonSuccess(response));
    }else{
      emit(PersonError());
    }}
  bool isShow=false;
    changeName(){
      isShow=!isShow;
      emit(ChangeName(isShow));
    }

}
