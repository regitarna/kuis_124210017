import 'package:flutter/material.dart';
import 'package:kuis_124210017/halaman_detail.dart';
import 'package:kuis_124210017/pokemon_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData place = listPokemon[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HalamanDetail(tempat: place);
                }));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.network(place.image),
                    ),
                    SizedBox(width: 30,),
                    Text(place.name)
                  ],
                ),
              ),
            );
          }),
    );
  }
}

