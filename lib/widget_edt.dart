import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Importez le package FlChart
import 'colors.dart';
import '/data/mat.dart'; // Importez la classe Mat

class WidgetEdt extends StatefulWidget {
  @override
  _WidgetEdtState createState() => _WidgetEdtState();
}

class _WidgetEdtState extends State<WidgetEdt> {
  bool isHovered = false;
  late List<String> matieres; // Liste des noms de matières

  @override
  void initState() {
    super.initState();
    // Initialisez la liste des noms de matières au démarrage du widget
    Mat.getFirstElements2().then((value) {
      setState(() {
        matieres = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<double>>>(
      future: Mat.getNotes2(), // Récupérer les notes depuis le fichier CSV
      builder: (context, snapshot) {
        if (snapshot.hasData && matieres.isNotEmpty) {
          // Limiter les données aux 4 premières matières
          List<List<double>> filteredData = snapshot.data!.length > 4 ? snapshot.data!.sublist(0, 4) : snapshot.data!;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 125.0, // Position horizontale du graphique
                  bottom: 60.0, // Position verticale du graphique
                  child: SizedBox(
                    width: isHovered ? 460.0 : 450.0,
                    height: isHovered ? 320.0 : 310.0,
                    child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Couleur transparente pour retirer le contour
                        ),
                        child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              // Titre du graphique
                              topTitles: SideTitles(
                                showTitles: false, // Masquer le titre du graphique
                              ),
                              // Axes des ordonnées (Y)
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                margin: 8,
                                reservedSize: 20,
                                interval: 5, // Intervalles de 5 entre les étiquettes
                              ),
                              // Axes des abscisses (X)
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                margin: 8,
                                reservedSize: 20,
                                interval: 1, // Intervalles de 1 mois entre les étiquettes
                                getTitles: (value) {
                                  // Convertir la valeur (mois) en chaîne de caractères
                                  int month = value.toInt() % 12 + 1;
                                  int year = 2024 + (value ~/ 12);
                                  return '$month/$year';
                                },
                              ),
                            ),
                            // Lignes de données pour les notes
                            lineBarsData: [
                              // Créer une série de données pour chaque matière
                              for (int i = 0; i < filteredData.length; i++)
                                LineChartBarData(
                                  spots: [
                                    for (int j = 0; j < filteredData[i].length; j++)
                                      FlSpot(j.toDouble(), filteredData[i][j]),
                                  ],
                                  isCurved: true,
                                  colors: [
                                    // Couleurs par défaut de Flutter
                                    Colors.blue,
                                    Colors.indigo.shade300,
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.orange,
                                  ],
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  belowBarData: BarAreaData(show: false),
                                ),
                            ],
                            // Masquer les lignes horizontales
                            gridData: FlGridData(show: false),
                            // Définir l'échelle maximale sur l'axe des ordonnées
                            maxY: 20,
                            // Définir l'échelle minimale sur l'axe des ordonnées
                            minY: 0,
                            // Ajouter le nom de la matière dans le tooltip
                            lineTouchData: LineTouchData(
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.indigo.shade400.withOpacity(0.8),
                                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                                  final tooltipItems = <LineTooltipItem>[];
                                  for (final touchedSpot in touchedSpots) {
                                    final matiere = matieres[touchedSpot
                                        .spotIndex.toInt()];
                                    final notes = touchedSpot.y;
                                    print(touchedSpots);
                                    tooltipItems.add(
                                      LineTooltipItem(
                                        '$matiere:\n'
                                            'Note : $notes,\n'
                                            'Note : $notes,\n'
                                            'Note : $notes,\n'
                                            'Note : $notes',
                                        TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }
                                  return tooltipItems;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 300.0, // Position horizontale du texte
                  bottom: 30.0, // Position verticale du texte
                  child: Text(
                    'Suivi des notes',
                    style: TextStyle(
                      color: AppColors().grisFonce,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


