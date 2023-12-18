import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/views.dart';
import 'bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
            PokemonBloc()..add(PokemonPageRequest(page: 0)))
      ], child: PokedexView()),
    );
  }
}