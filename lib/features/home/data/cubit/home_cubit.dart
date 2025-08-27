import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  productAll()async{
    emit(HomeLoading());
  try{
    final repo=await  Home.productAll();
    if(repo["status"]==200){
      final product= repo["data"]["products"];
      emit(HomeSuccess(product));
    }
    else{
     emit(HomeError("Something went wrong!"));
    }
  }catch(e){
    emit(HomeError(e.toString()));
  }
  }
}
