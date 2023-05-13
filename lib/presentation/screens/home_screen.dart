import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orel_it_abithra/presentation/screens/business_screen.dart';
import 'package:orel_it_abithra/presentation/screens/science_screen.dart';
import 'package:orel_it_abithra/presentation/screens/technolgy_screen.dart';
import '../../data/bloc/business_bloc/busniess_bloc.dart';
import '../../data/bloc/science_bloc/science_bloc.dart';
import '../../data/bloc/technology_bloc/technology_bloc.dart';
import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    BlocProvider<ScienceDataBloc>(
      create: (context) => ScienceDataBloc(),
      child: const ScienceScreen(),
    ),
    BlocProvider<BusinessDataBloc>(
      create: (context) => BusinessDataBloc(),
      child: const BusinessScreen(),
    ),
    BlocProvider<TechnologyDataBloc>(
      create: (context) => TechnologyDataBloc(),
      child: const TechnologyScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'News',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary.shade100,
        elevation: 0.0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary.shade300,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Technology',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
