import 'package:flutter/material.dart';
import 'package:dashboard_bouarour_fodouop_gaudeaux/colors.dart';

class Matieres extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors().gradient,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [ // Ajout de l'ombre ici
            BoxShadow(
              color: AppColors().grisFonce.withOpacity(0.5), // Couleur de l'ombre sur le widget
              spreadRadius: 2, // Rayon de diffusion
              blurRadius: 2, // Flou gaussien
              offset: Offset(0, 2), // Décalage de l'ombre
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              // Ajout de l'ombre à la barre de recherche
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors().grisFonce.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: AppColors().grisFonce),
                decoration: InputDecoration(
                  hintText: 'Rechercher une matière',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,

                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade300, size: 24),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none, // Aucune couleur de contour
                  ),
                ),
                onSubmitted: (value) {
                  // Action à effectuer lors de la soumission de la recherche
                  print('Recherche: $value');
                },
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(12, (index) {
                  return Center(
                    child: Text(
                      'Matière ${index + 1}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Action à effectuer lors de l'appui sur le bouton Retour
          Navigator.of(context).pop();
        },
        label: Text('Retour'),
        icon: Icon(Icons.arrow_back),

        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position du bouton dans l'angle inférieur droit
    );
  }
}
