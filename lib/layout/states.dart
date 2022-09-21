
import '../cubit/states.dart';

abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessDataSucessState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessDataErrorState extends NewsStates{final String error;
NewsGetBusinessDataErrorState(this.error);}
class NewsGetSportsDataSucessState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsDataErrorState extends NewsStates{final String error;
NewsGetSportsDataErrorState(this.error);}
class NewsGetScienceDataSucessState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceDataErrorState extends NewsStates
{
  final String error;
  NewsGetScienceDataErrorState(this.error);
}
class NewsGetSettingsDataSucessState extends NewsStates{}
class NewsGetSettingsLoadingState extends NewsStates{}
class NewsGetSettingsDataErrorState extends NewsStates{}
class AppSearchingBottomMode extends AppStates{}
class NewsGetSearchDataSucessState extends NewsStates{}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchDataErrorState extends NewsStates
{
  final String error;
  NewsGetSearchDataErrorState(this.error);
}


