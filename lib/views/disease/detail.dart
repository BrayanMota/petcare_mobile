import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/custom_messages.dart';
import 'package:petcare/components/custom_progress_indicator.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/providers/disease_provider.dart';
import 'package:petcare/routes.dart';
import 'package:provider/provider.dart';

class ViewDiseasePage extends StatelessWidget {
  const ViewDiseasePage({super.key});

  Widget detailBuilder(
  BuildContext context,
  Disease disease,
) {
  return Scaffold(
    drawer: CustomDrawer(),
    appBar: CustomAppBar(
      title: disease.nome,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            disease.descricao,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0), // Espaço entre o texto e os ListTiles
          // Usando o componente DiseaseListTile para cada categoria

          ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: Text('Sinais Clínicos'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.presentationDisease,
                arguments: {
                  'doenca': disease.id,
                  'topico': 'Sinais Clínicos'
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.blue),
            title: Text('Diagnóstico'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.presentationDisease,
                arguments: {
                  'doenca': disease.id,
                  'topico': 'Diagnóstico'
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shield, color: Colors.green),
            title: Text('Prevenção'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.presentationDisease,
                arguments: {
                  'doenca': disease.id,
                  'topico': 'Prevenção'
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.autorenew, color: Colors.orange),
            title: Text('Ciclo da Doença'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.presentationDisease,
                arguments: {
                  'doenca': disease.id,
                  'topico': 'Ciclo da Doença'
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.purple),
            title: Text('Boletim Epidemiológico'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.presentationDisease,
                arguments: {
                  'doenca': disease.id,
                  'topico': 'Boletim Epidemiológico'
                },
              );
            },
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final String diseaseId =
        ModalRoute.of(context)?.settings.arguments as String;

    DiseaseProvider diseaseProvider =
        Provider.of<DiseaseProvider>(context);

    return FutureBuilder<Disease>(
        future: diseaseProvider.read(diseaseId),
        builder: (context, snapshot) {
          final connState = snapshot.connectionState;
          const connWaiting = ConnectionState.waiting;
          if (connState == connWaiting) {
            return circularProgress();
          } else if (snapshot.hasError) {
            return errorMessage('${snapshot.error}');
          } else if (snapshot.hasData) {
            return detailBuilder(context, snapshot.data!);
          } else {
            return errorMessage('Sem dado disponivel.');
          }
        },
      
    );
  }
}
