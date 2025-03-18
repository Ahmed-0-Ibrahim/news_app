import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/states.dart';

import '../network/local/cashe_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  bool darkMode = CashHelper.get().getData('isDark');
  void changeDarkOrLightMode() {
    darkMode = !darkMode;
    print('dark $darkMode');
    CashHelper.get().setBoolData('isDark', darkMode).then((value){
      print('vvv $value');
      emit(ChangeDarkOrLightModeState());
    });

  }
}