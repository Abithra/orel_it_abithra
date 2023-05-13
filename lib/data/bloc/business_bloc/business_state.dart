

import '../../models/business_model.dart';

abstract class BusinessDataState {}

class BusinessDataInitial extends BusinessDataState {}

class BusinessDataLoading extends BusinessDataState {}

class BusinessDataLoaded extends BusinessDataState {
  final List<BusinessData> businessDataList;
  BusinessDataLoaded(this.businessDataList);
}

class BusinessDataError extends BusinessDataState {
  final String message;
  BusinessDataError(this.message);
}