import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:orel_it_abithra/data/bloc/technology_bloc/technology_event.dart';
import 'package:orel_it_abithra/data/bloc/technology_bloc/technology_state.dart';
import '../../models/technology_model.dart';

class TechnologyDataBloc extends Bloc<TechnologyDataEvent, TechnologyDataState> {
  TechnologyDataBloc() : super(TechnologyDataInitial()) {
    on<FetchTechnologyData>((event, emit) => _mapFetchDataToState(event, emit));
  }

  void _mapFetchDataToState(FetchTechnologyData event, Emitter<TechnologyDataState> emit) async {
    emit(TechnologyDataLoading());
    try {
      final response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category=technology"));
      final List<TechnologyData> dataList = (json.decode(response.body)["data"] as List)
          .map((data) => TechnologyData.fromJson(data))
          .toList();
      emit(TechnologyDataLoaded(dataList));
    } catch (e) {
      emit(TechnologyDataError("Failed to fetch data"));
    }
  }

  @override
  void onTransition(Transition<TechnologyDataEvent, TechnologyDataState> transition) {
    super.onTransition(transition);
  }

  @override
  void onEvent(TechnologyDataEvent event) {
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
