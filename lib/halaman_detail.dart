import 'package:flutter/material.dart';
import 'package:kuis_124210017/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final PokemonData tempat;

  const HalamanDetail({Key? key, required this.tempat}) : super(key: key);

  @override
  _HalamanDetailState createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tempat.name),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });

              final snackBar = SnackBar(
                content: Text(isFavorite
                    ? 'Ditambahkan ke Favorit'
                    : 'Dihapus dari Favorit'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 5,
            child: Image.network(widget.tempat.image),
          ),
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      widget.tempat.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                Text("Nama", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.tempat.name),

                Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.tempat.type[0]),

                Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.tempat.weakness[0]),
              ],
            ),
          ),
          SizedBox(height: 40,),
          IconButton(
            onPressed: () {
              _launcher(widget.tempat.wikiUrl);
            },
            icon: Icon(Icons.link),
          ),
        ],
      ),
    );
  }

  Future<void> _launcher(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launch(_url.toString())) {
      throw Exception("Gagal membuka url : $_url");
    }
  }
}
