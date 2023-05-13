import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:orel_it_abithra/data/bloc/business_bloc/business_state.dart';
import '../../models/business_model.dart';
import 'busniess_event.dart';

class BusinessDataBloc extends Bloc<BusinessDataEvent, BusinessDataState> {
  BusinessDataBloc() : super(BusinessDataInitial()) {
    on<FetchBusinessData>((event, emit) => _mapFetchDataToState(event, emit));
  }

  void _mapFetchDataToState(FetchBusinessData event, Emitter<BusinessDataState> emit) async {
    emit(BusinessDataLoading());
    try {
      final response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category=business"));
      final List<BusinessData> businessDataList = (json.decode(response.body)["data"] as List)
          .map((data) => BusinessData.fromJson(data))
          .toList();
      emit(BusinessDataLoaded(businessDataList));
    } catch (e) {
      emit(BusinessDataError("Failed to fetch data"));
    }
  }

  @override
  void onTransition(Transition<BusinessDataEvent, BusinessDataState> transition) {
    super.onTransition(transition);
  }

  @override
  void onEvent(BusinessDataEvent event) {
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
