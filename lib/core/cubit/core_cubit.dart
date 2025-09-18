import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreInitial());
bool isDark=false;
  toggleMode(int i){
   if(i==0){
     isDark=true;
   }
   else if(i==1){
     isDark=false;
   }
    emit(ChangeMode(isDark));
  }
}
