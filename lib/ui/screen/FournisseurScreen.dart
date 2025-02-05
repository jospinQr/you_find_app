import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_app/data/Fournisseur.dart';

class Fournisseurscreen extends StatelessWidget {
  const Fournisseurscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fournisseur.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              fournisseur[index].name,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              fournisseur[index].contact,
            ),
            trailing: Text(fournisseur[index].adress),
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                "images/${fournisseur[index].imgurl!}",
              ),
            ),
          );
        },
      ),
    );
  }
}
