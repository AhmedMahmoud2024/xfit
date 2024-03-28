// import 'dart:convert';
// //import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class BackEnd extends StatefulWidget{
//
//   const BackEnd ({super.key});
//
//   @override
//   State<BackEnd> createState() => _BackEndState();
// }
//
// class _BackEndState extends State<BackEnd> {
//   bool loading =false; //true
// Future <List> getData() async{
//   //  var resopnse
//     var response = await
//             get(
//                 Uri.parse("https://x-fit-backend-graduation-project.vercel.app"));
//             var responsebody= jsonDecode(response.body);
//             //loading=false;
//     return responsebody;
//   }
//
// //     addPosts() async{
// //  var response = await post(Uri.parse("https://x-fit-backend-graduation-project.vercel.app"),body: {
// //    "name":'ahmed',
// //    "age":1,
// //    "weight":50
// //  });
// //   var responsebody=jsonDecode(response.body);
// //   return responsebody ;
// // }
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   List data=[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Package"),
//       ),
//     body:
//     ListView(
//       children: [
//         // MaterialButton(onPressed: () async{
//         //   var response = await
//         //   get(
//         //       Uri.parse("https://x-fit-backend-graduation-project.vercel.app"));
//         //   var responsebody= jsonDecode(response.body) ;
//         //   //loading=false;
//         //   return responsebody ;
//         // },
//         //   child:Text("Add Post")
//         // ),
//         FutureBuilder<List>(
//           future: getData(),
//           builder: (context,snapshot) {
//             if (snapshot.hasData) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator(),);
//               }
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, i) {
//                       return ListTile(
//                         title: Text("name: ${snapshot.data![i]['name']}"),
//                         subtitle: Text("age: ${snapshot.data![i]['age']}"),
//                       );
//                     }
//                 );
//               }
//
//
//               if (snapshot.hasError) {
//                 return Text("Error");
//               }
//
//             }
//             return Text("Error");
//
//           }
//
//           ,
//         ),
//       ],
//     ),
//     // ListView(
//     //   children: [
//     //     Container(
//     //       margin: const EdgeInsets.symmetric(horizontal: 30),
//     //       child: MaterialButton(onPressed: ()  async {
//     //         var response = await
//     //         get(
//     //             Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//     //         var responsebody= jsonDecode(response.body);
//     //         loading=false;
//     //      data.addAll(responsebody);
//     //      setState(() {
//     //
//     //      });
//     //        // print(responsebody[1]['title']);
//     //       }, child: const Text("Http Request"),
//     //
//     //       ),
//     //     ),
//     //     //futurebuilder
//     //
//     //     //
//     //     if(loading) const Center(child: CircularProgressIndicator(),),
//     //     ...List.generate(data.length, (index) => Card(
//     //       child: ListTile(
//     //         title: Text("title: ${data[index]['title']}"),
//     //       subtitle: Text("body: ${data[index]['body']}"),),
//     //
//     //     ))
//     //   ],
//     // ),
//     )
//
//     ;  }
// }