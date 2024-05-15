import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _list1State();
}

class _list1State extends State<list> {
  TextEditingController a = TextEditingController();
  // TextEditingController b=TextEditingController();
    TextEditingController email=TextEditingController();
   TextEditingController pass =TextEditingController();
    TextEditingController mobile =TextEditingController();
  // final _formkey =GlobalKey<FormState>();

  List items = [];
    List mail =[];
   List pas =[];
  List mbl =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("CRUD OPERATIONS"),
      ),
      body: Column(
        children: [
          // key: _formkey,
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextFormField(
              controller: a,
              decoration: InputDecoration(
                hintText: "Enter the string",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextFormField(
               controller: email,
              decoration: InputDecoration(
                hintText: "Enter the email Id",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextFormField(
              controller: pass,
              decoration: InputDecoration(
                hintText: "Enter the Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 300,
            child: TextFormField(
               controller: mobile,
              decoration: InputDecoration(
                hintText: "Enter your mobile number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // SizedBox(
          //   height: 10,
          // ),

          Container(
            height: 140,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  child: ListTile(
                    title: Column(
                      children: [
                        Text(items[index]),
                        Text(mail[index]),
                        Text(pas[index]),
                        Text(mbl[index]),
                      ],
                    ),
                    tileColor: CupertinoColors.lightBackgroundGray,
                    leading: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {

                                return AlertDialog(
                                  content: Container(
                                    height: 290,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: a,


                                        ),
                                        TextFormField(
                                          controller: email,


                                        ),
                                        TextFormField(
                                          controller: pass,


                                        ),
                                        TextFormField(
                                          controller: pass,


                                        ),
                                        ElevatedButton(onPressed: (){
                                          setState(() {
                                            items[index]=a.text;
                                            a.clear();
                                          });

                                          setState(() {
                                            mail[index]=email.text;
                                            email.clear();
                                          });
                                          setState(() {
                                            pas[index]=pass.text;
                                            pass.clear();
                                          });
                                          setState(() {
                                            mbl[index]=mobile.text;
                                            mobile.clear();
                                          });
                                          Navigator.pop(context);
                                        }, child: Text("click"))
                                      ],
                                    ),

                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.edit)),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.add(a.text.toString());
                  });
                  setState(() {
                    mail.add(email.text.toString());
                  });
                  setState(() {
                    pas.add(pass.text.toString());
                  });
                  setState(() {
                    mbl.add(mobile.text.toString());
                  });
                },
                child: Text("add")),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items.sort();
                      items.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                            child: Column(
                              children: [
                                Text("Max=${items.last}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Maximum"),
                ),
              ),
              Padding(


                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items.sort();
                      items.sort((a, b) => int.parse(a).compareTo(int.parse(b),),);
                    });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100,
                              width: 100,
                              color: Colors.pink,
                              child: Column(
                                children: [
                                  Text(
                                    "min=${items.first}",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text("Minimum"),
                ),
              ),
            ],

          ),



          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items.sort((b, a) => int.parse(a).compareTo(int.parse(b)));
                      });
                    },
                    child: Text("Descending")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
                      });
                    },
                    child: Text("ascending")),
              ),
            ],

          ),

        ],
      ),
    );
  }
}
// Navigator.of(context).pop();
// a.clear();

// child: ListTile(
// // tileColor: Colors.pinkAccent,
// title:Text(items[index]),
// trailing: IconButton(onPressed: ()
// {
// setState(() {
// items.removeAt(index);toString();
//
// });
// },
// icon: Icon(Icons.delete),),
// leading: IconButton(onPressed: ()
//
// {
//
//
// showDialog(context: context,
// builder: (BuildContext context){
// return  AlertDialog(
// content: Container(
// height: 150,
// width: 100,
// child: Column(
// children: [
// TextFormField(
// controller: a,
// decoration: InputDecoration(
// border: OutlineInputBorder(),
// ),
// ),
// ElevatedButton(onPressed: (){
//
// setState(() {
// items[index]=a.text;
//
//
// // Navigator.of(context).pop();
// a.clear();
//
// });
// }, child: Text("save")),
// ],
// ),
//
//
//
//
//
//
// ),
//
// );
// });
// },
// icon: Icon(Icons.edit),),
// ),
