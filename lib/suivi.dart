import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


// Classe représentant les données de progression
class Progression {
  final String country;
  final int population;
  final charts.Color color;

  Progression(this.country, this.population, this.color);
}

// Classe représentant le widget Suivi
class Suivi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Données de progression
    var data = [
      Progression('USA', 3290, charts.Color.fromHex(code: '#FF0000')),
      Progression('US', 429, charts.Color.fromHex(code: '#0000FF')),
      Progression('SA', 39, charts.Color.fromHex(code: '#00FF00')),
      Progression('Albanie', 329, charts.Color.fromHex(code: '#A52A2A')),
      Progression('Blaise', 3209, charts.Color.fromHex(code: '#FFC0CB')),
      Progression('USA', 3, charts.Color.fromHex(code: '#800080')),
    ];

    // Définir la série pour le graphique
    var series = [
      charts.Series<Progression, String>(
        domainFn: (Progression progression, _) => progression.country,
        measureFn: (Progression progression, _) => progression.population,
        colorFn: (Progression progression, _) => progression.color,
        id: "Progression",
        data: data,
      )
    ];

    // Créer le graphique avec une échelle logarithmique pour l'axe des mesures
    var chart = charts.BarChart(
      animate: true,
      series,
      defaultRenderer: charts.BarRendererConfig(),
    );

    // Retourner le graphique enveloppé dans un conteneur avec les paramètres de positionnement
    return Positioned(
      top: 290,
      left: 670,
      child: Container(
        width: 520,
        height: 250,
        child: chart,
      ),
    );
  }
}
