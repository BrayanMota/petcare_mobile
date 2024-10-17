import 'package:flutter/material.dart';
import 'package:petcare/components/custom_appbar.dart';
import 'package:petcare/components/custom_drawer.dart';
import 'package:petcare/components/custom_messages.dart';
import 'package:petcare/components/custom_progress_indicator.dart';
import 'package:petcare/components/disease_list_item.dart';
import 'package:petcare/models/disease.dart';
import 'package:petcare/providers/disease_provider.dart';
import 'package:petcare/routes.dart';
import 'package:provider/provider.dart';

class ListDiseasesPage extends StatefulWidget {
  const ListDiseasesPage({super.key});

  @override
  _ListDiseasesPageState createState() => _ListDiseasesPageState();
}

class _ListDiseasesPageState extends State<ListDiseasesPage> {
  Widget listBuider(BuildContext context, List<Disease> diseases) {
    return ListView.builder(
      itemCount: diseases.length,
      itemBuilder: (context, index) {
        return DiseaseListItem(
          disease: diseases[index],
          onView: () {
            Navigator.of(context).pushNamed(RoutePaths.viewDisease,
                arguments: diseases[index].id);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DiseaseProvider diseaseProvider = Provider.of<DiseaseProvider>(context);

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Doenças',
        ),
        body: FutureBuilder<List<Disease>>(
          future: diseaseProvider.list(),
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
              return errorMessage('Sem dados disponiveis.');
            }
          },
        ),
      ),
    );
  }
}
