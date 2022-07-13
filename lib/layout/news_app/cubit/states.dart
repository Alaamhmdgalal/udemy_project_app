abstract class NewsAppStates{}

class InitialNewsAppState extends NewsAppStates{}

class BottomNavBarNewsAppState extends NewsAppStates{}

class NewsBusinessSuccessState extends NewsAppStates{}

class NewsBusinessFailedState extends NewsAppStates
{
  final String error;

  NewsBusinessFailedState(this.error);
}

class NewsBusinessLoadingState extends NewsAppStates{}

class NewsSportsSuccessState extends NewsAppStates{}

class NewsSportsFailedState extends NewsAppStates
{
  final String error;

  NewsSportsFailedState(this.error);
}

class NewsSportsLoadingState extends NewsAppStates{}

class NewsScienceSuccessState extends NewsAppStates{}

class NewsScienceFailedState extends NewsAppStates
{
  final String error;

  NewsScienceFailedState(this.error);
}

class NewsScienceLoadingState extends NewsAppStates{}

class NewsSearchSuccessState extends NewsAppStates{}

class NewsSearchFailedState extends NewsAppStates
{
  final String error;

  NewsSearchFailedState(this.error);
}

class NewsSearchLoadingState extends NewsAppStates{}
