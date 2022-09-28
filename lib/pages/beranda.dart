import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mabesal/pages/profile_page.dart';

import '../common/ProductDataModel.dart';
import '../common/drawer_helper.dart';

class BerandaPage extends StatefulWidget{
  const BerandaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BerandaPageState();
  }
}

class _BerandaPageState extends State<BerandaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
              )
          ),
        ),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu),
            );
          }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> (const ProfilePage())));
              },
              child: const Icon(Icons.person_pin),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image(image: NetworkImage(items[index].imageURL.toString()),
                                fit: BoxFit.fill,),
                            ),
                            Expanded(child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                                    child: Text(items[index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                                    child: Text(items[index].nrp.toString()),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return const Center(child: CircularProgressIndicator(),
              );
            }
          },
        ),
    );
  }

  Future<List<ProductDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/sample_data.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
