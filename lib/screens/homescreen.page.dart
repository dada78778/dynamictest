import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nmgassign/screens/model.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  List<SimplePosts> simplePosts=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: simplePosts.length,
                itemBuilder: (context,index) {
                  return Container(
                    color: Colors.pinkAccent,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User id: ${simplePosts[index].userId}',style: const TextStyle(
                          fontSize: 18.0,
                        ),),
                        Text('Id: ${simplePosts[index].id}',style: const TextStyle(
                          fontSize: 18.0,
                        ),),
                        Text('title id: ${simplePosts[index].title}',style: const TextStyle(
                          fontSize: 18.0,
                        ),),
                        Text('Desc.: ${simplePosts[index].body}',maxLines: 2,style: const TextStyle(
                          fontSize: 18.0,
                        ),
                        ),
                      ],
                    ),
                  );
                }
            );
          }
          return const CircularProgressIndicator();
        }
      ),
    );
  }

  Future<List<SimplePosts>> getData() async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data= jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map<String, dynamic> index in data){
        simplePosts.add(SimplePosts.fromJson(index));
      }
      return simplePosts;
    }else{
      return simplePosts;
    }
  }
}