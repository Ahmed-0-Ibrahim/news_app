abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class ChangeCurrentIndexState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  late final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsChangeCategoryState extends NewsStates{}

