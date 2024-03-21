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
          boxShadow: [
            BoxShadow(
              color: AppColors().grisFonce.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  print('Recherche: $value');
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Nombre de colonnes dans la grille
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 12, // Nombre total d'éléments dans la grille
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Text(
                        'Matière ${index + 1}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Text('Retour'),
        icon: Icon(Icons.arrow_back),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
