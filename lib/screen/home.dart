import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/main_cubit.dart';
import 'package:flutter_application_1/cubit/main_state.dart';
import 'package:flutter_application_1/screen/card.dart';
import 'package:flutter_application_1/screen/sort/sortnew.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

 @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('GameList List'),
            actions: [
              IconButton(icon: const Icon(Icons.newspaper), onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Sortnew()),
                );
               },)
            ],
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return card(
                imageUrl: state.games[index].thumbnail!,
                title: state.games[index].title!,
                id: state.games[index].id!,
              );
            },
          ),
        );
      },
    );
  }
}
