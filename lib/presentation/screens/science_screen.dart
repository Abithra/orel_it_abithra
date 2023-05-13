import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orel_it_abithra/data/bloc/science_bloc/science_event.dart';
import 'package:orel_it_abithra/data/bloc/science_bloc/science_state.dart';
import 'package:orel_it_abithra/presentation/widgets/card_view.dart';
import '../../data/bloc/science_bloc/science_bloc.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  ScienceScreenState createState() => ScienceScreenState();
}

class ScienceScreenState extends State<ScienceScreen> {
  final ScienceDataBloc _scienceDataBloc = ScienceDataBloc();

  @override
  void initState() {
    super.initState();
    _scienceDataBloc.add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScienceDataBloc>(
      create: (context) => _scienceDataBloc,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Text(
                'Science',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Here is your science news',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<ScienceDataBloc, ScienceDataState>(
                  builder: (context, state) {
                    if (state is ScienceDataInitial) {
                      // Initial state
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ScienceDataLoading) {
                      // Loading state
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ScienceDataLoaded) {
                      // Data loaded state
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.scienceDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = state.scienceDataList[index];
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
                    } else if (state is ScienceDataError) {
                      // Error state
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      // Unknown state
                      return const Center(
                        child: Text("Unknown state"),
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
    _scienceDataBloc.close();
    super.dispose();
  }
}
