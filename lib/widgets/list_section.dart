import 'package:flutter/material.dart';

class ListSectionWithHeader extends StatelessWidget {
  final String header;
  final List<String> elements;
  final ListType listType;

  ListSectionWithHeader(
      {required this.header,
      required this.elements,
      this.listType = ListType.Card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            header,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                if (listType == ListType.Card) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(elements[index]),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(elements[index]),
                        ),
                      ),
                      Divider(color: Colors.blueGrey,),
                    ],
                  );
                }
              },
              itemCount: elements.length,
            ),
          ),
        ],
      ),
    );
  }
}

enum ListType { Card, NumberWithDivider }
