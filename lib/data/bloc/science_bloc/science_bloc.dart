import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:orel_it_abithra/data/bloc/science_bloc/science_event.dart';
import 'package:orel_it_abithra/data/bloc/science_bloc/science_state.dart';
import '../../models/science_model.dart';

class ScienceDataBloc extends Bloc<ScienceDataEvent, ScienceDataState> {
  ScienceDataBloc() : super(ScienceDataInitial()) {
    on<FetchData>((event, emit) => _mapFetchDataToState(event, emit));
  }

  void _mapFetchDataToState(FetchData event, Emitter<ScienceDataState> emit) async {
    emit(ScienceDataLoading());
    try {
      final response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category=science"));
      final List<ScienceData> dataList = (json.decode(response.body)["data"] as List)
          .map((data) => ScienceData.fromJson(data))
          .toList();
      emit(ScienceDataLoaded(dataList));
    } catch (e) {
      emit(ScienceDataError("Failed to fetch data"));
    }
  }

  @override
  void onTransition(Transition<ScienceDataEvent, ScienceDataState> transition) {
    super.onTransition(transition);
  }

  @override
  void onEvent(ScienceDataEvent event) {
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
