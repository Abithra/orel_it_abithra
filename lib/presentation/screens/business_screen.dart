import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orel_it_abithra/data/bloc/business_bloc/business_state.dart';
import 'package:orel_it_abithra/presentation/widgets/card_view.dart';

import '../../data/bloc/business_bloc/busniess_bloc.dart';
import '../../data/bloc/business_bloc/busniess_event.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  BusinessScreenState createState() => BusinessScreenState();
}

class BusinessScreenState extends State<BusinessScreen> {
  final BusinessDataBloc _businessDataBloc = BusinessDataBloc();

  @override
  void initState() {
    super.initState();
    _businessDataBloc.add(FetchBusinessData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessDataBloc>(
      create: (context) => _businessDataBloc,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Text(
                'Business',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Here is your business news',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<BusinessDataBloc, BusinessDataState>(
                  builder: (context, state) {
                    if (state is BusinessDataInitial) {
                      // Initial state
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BusinessDataLoading) {
                      // Loading state
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BusinessDataLoaded) {
                      // Data loaded state
                      return Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.businessDataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = state.businessDataList[index];
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
                          ),
                        ),
                      );
                    } else if (state is BusinessDataError) {
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
    _businessDataBloc.close();
    super.dispose();
  }
}
