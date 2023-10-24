import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/login.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // parametre de image
              Container(
                width: double.infinity, // Largeur complète de l'émulateur
                height: MediaQuery.of(context).size.height / 2, // Moitié de la hauteur de l'émulateur
                margin: EdgeInsets.only(top: 20.0), // Marge depuis le haut de l'émulateur
                child: Image.asset(
                  'assets/images/send.png', 
                  fit: BoxFit.contain, 
                ),
              ),
              SizedBox(height: 17.0),

              // Titre
              Text(
                'Travel & Business',
                style: TextStyle(
                  color: Colors.purpleAccent
                  ,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0),

             
              Container(
                width: double.infinity, // Largeur complète de la description
                child: Text(
                  'You can Send & Receive anything \nlike Document,clothes,Urgent medicines,Canned Food \nwith our traveler community',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0, 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.0),

              // Bouton "Get Started" pour naviguer vers la page de connexion (LoginPage)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Remplacez LoginPage par le nom de votre page de connexion
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Couleur de fond violette
                  padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte en blanc
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
