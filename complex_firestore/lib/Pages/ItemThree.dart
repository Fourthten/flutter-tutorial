import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemThree extends StatefulWidget {
  @override
  _ItemThreeState createState() => _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {
  Future getGridView() async{
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").getDocuments();
    return snap.documents;
  }

  Future<Null> getRefresh() async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getGridView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
        future: getGridView(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ), 
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  var ourData = snapshot.data[index];

                  return Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: InkWell(
                      onTap: (){
                        customDialog(context, 
                          ourData.data['image']
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          ourData.data['image'],
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  );
                }
              ), 
              onRefresh: getRefresh
            );
          }
        }
      ),
    );
  }

  customDialog(BuildContext context, String image){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height/1.20,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(image,
                fit: BoxFit.cover
              )
            ),
          )
        );
      }
    );
  }
}