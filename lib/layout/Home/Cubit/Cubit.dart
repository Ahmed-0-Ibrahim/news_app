import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/Home/Cubit/States.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
  int currentIndex = 0;
  List business = [];
  List sports = [];
  List science = [];
  String category = 'business';


  static NewsCubit get(context) => BlocProvider.of(context);

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }



  void changeCategory(c) {
    category = c;
    emit(NewsChangeCategoryState());
    getBusiness('us');
  }

  void getBusiness(String country) {
    if (business.isEmpty || science.isEmpty || sports.isEmpty) {
      emit(NewsLoadingState());
      DioHelper.getData('v2/top-headlines', {
        'country': country,
        'category': category,
        'apiKey': '62e8bbaa85d74fca8a587b117f91bda1'
      }).then((value) {
        if (category == 'business') {
          business = value.data['articles'];
        } else if (category == 'sports') {
          sports = value.data['articles'];
        } else if (category == 'science') {
          science = value.data['articles'];
        }

        emit(NewsGetBusinessSuccessState());
      }).catchError((e) {
        emit(NewsGetBusinessErrorState(e.toString()));
        print("erorr is ${e.toString()}");
      });
    }
  }
}
