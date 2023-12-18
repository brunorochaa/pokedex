import 'package:projeto_final/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonListings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl, height: 100.0, width: 100.0, alignment: Alignment.bottomRight,),
                          Image.asset('images/pokemon/pokeball.png', height: 100.0, width: 100.0, alignment: Alignment.bottomRight,),
                          Text(state.pokemonListings[index].name.toUpperCase(), style: TextStyle(color: Colors.white, fontFamily: 'MavenPro', fontWeight: FontWeight.w500,),),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)
                        )
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}