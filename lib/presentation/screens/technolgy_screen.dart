import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orel_it_abithra/data/bloc/technology_bloc/technology_bloc.dart';
import 'package:orel_it_abithra/data/bloc/technology_bloc/technology_event.dart';

import '../../data/bloc/technology_bloc/technology_state.dart';
import '../widgets/card_view.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  TechnologyScreenState createState() => TechnologyScreenState();
}

class TechnologyScreenState extends State<TechnologyScreen> {
  late TechnologyDataBloc _technologyDataBloc;

  @override
  void initState() {
    super.initState();
    _technologyDataBloc = TechnologyDataBloc()..add(FetchTechnologyData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechnologyDataBloc>(
      create: (context) => _technologyDataBloc,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Text(
                'Technology',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Here is your technology news',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<TechnologyDataBloc, TechnologyDataState>(
                  builder: (context, state) {
                    if (state is TechnologyDataInitial) {
                      return const Center(
                        child: Text('Initial State'),
                      );
                    } else if (state is TechnologyDataLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is TechnologyDataLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.technologyDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = state.technologyDataList[index];
                          return Column(
                            children: [
                              AppCard(
                                title: data.title,
                                subTitle: data.author,
                                imageUrl: data.imageUrl,
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      );
                    } else if (state is TechnologyDataError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return const Center(
                        child: Text('Unknown state'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _technologyDataBloc.close();
    super.dispose();
  }
}
