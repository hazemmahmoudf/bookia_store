import 'package:bloc/bloc.dart';
import 'package:bookia/features/basket/data/repo/show_card_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/show_card_model.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketInitial());

  showCard()async{
    emit(BasketLoading());
    final response= await ShowCardRepo.showCard();
    if(response!=null){
    if(response is ShowCard){
      emit(BasketSuccess(response.data?.cartItems??[],response.data?.total??""));
    }
    }
    else{
      emit(BasketError());
    }
  }
  removeCard(int itemId)async{
    emit(BasketRemoveLoading());
    final response= await ShowCardRepo.removeCart(itemId);
    if(response!=null){
      emit(BasketRemoveSuccess(response));
    }
    else{
      emit(BasketRemoveError());
    }
  }

}
