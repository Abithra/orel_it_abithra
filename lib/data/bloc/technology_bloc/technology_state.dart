import 'package:orel_it_abithra/data/models/technology_model.dart';


abstract class TechnologyDataState {}

class TechnologyDataInitial extends TechnologyDataState {}

class TechnologyDataLoading extends TechnologyDataState {}

class TechnologyDataLoaded extends TechnologyDataState {
  final List<TechnologyData> technologyDataList;
  TechnologyDataLoaded(this.technologyDataList);
}

class TechnologyDataError extends TechnologyDataState {
  final String message;
  TechnologyDataError(this.message);
}