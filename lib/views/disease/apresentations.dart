import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/custom_messages.dart';
import 'package:petcare/components/custom_progress_indicator.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/providers/disease_provider.dart';
import 'package:petcare/utils/custom_colors.dart';
import 'package:provider/provider.dart';

class ViewDiseasePage extends StatelessWidget {
  const ViewDiseasePage({super.key});

  Widget listBuider(
      BuildContext context, List<PresentationDisease> presentation) {
    return ListView.builder(
      itemCount: presentation.length,
      itemBuilder: (context, index) {
        return presentationDiseaseBuilder(
          context,
          presentation[index],
        );
      },
    );
  }

  Widget presentationDiseaseBuilder(
    BuildContext context,
    PresentationDisease presentation,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            presentation.texto!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String diseaseId =
        ModalRoute.of(context)?.settings.arguments as String;

    PresentationDiseaseProvider diseaseProvider =
        Provider.of<PresentationDiseaseProvider>(context);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Detalhes',
      ),
      body: FutureBuilder<List<PresentationDisease>>(
        future: diseaseProvider.list(diseaseId),
        builder: (context, snapshot) {
          final connState = snapshot.connectionState;
          const connWaiting = ConnectionState.waiting;
          if (connState == connWaiting) {
            return circularProgress();
          } else if (snapshot.hasError) {
            return errorMessage('${snapshot.error}');
          } else if (snapshot.hasData) {
            return listBuider(context, snapshot.data!);
          } else {
            return errorMessage('Sem dado disponivel.');
          }
        },
      ),
    );
  }
}
