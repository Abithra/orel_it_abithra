import '../../models/science_model.dart';

abstract class ScienceDataState {}

class ScienceDataInitial extends ScienceDataState {}

class ScienceDataLoading extends ScienceDataState {}

class ScienceDataLoaded extends ScienceDataState {
  final List<ScienceData> scienceDataList;
  ScienceDataLoaded(this.scienceDataList);
}

class ScienceDataError extends ScienceDataState {
  final String message;
  ScienceDataError(this.message);
}