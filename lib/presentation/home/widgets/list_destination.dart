import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wizhapp/models/list_destination_response_model.dart';
import 'package:intl/intl.dart';
import 'package:wizhapp/presentation/detail/detail_page.dart';

class ListDestinationView extends StatefulWidget {
  const ListDestinationView({super.key});

  @override
  State<ListDestinationView> createState() => _ListDestinationViewState();
}

class _ListDestinationViewState extends State<ListDestinationView> {
  final List<ListDestinationData> data = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // GET DATA
    getListDestinationData();
  }

  // GET LIST DATA
  void getListDestinationData() async {
    final String response = await rootBundle.loadString(
      'docs/list_data_destination.json',
    );
    final ListDestinationResponseModel responseModel =
        ListDestinationResponseModel.fromJson(json.decode(response));
    setState(() {
      data.addAll(responseModel.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var destinationData = data[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return DetailPage(destinationData: destinationData);
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 236, 236, 236),
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      destinationData.thumbnail,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinationData.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          destinationData.location,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: const Color.fromARGB(255, 255, 154, 59),
                            ),
                            Text(
                              " ${destinationData.rating.toString()}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 2),
                        Text(
                          "Rp ${NumberFormat('#,##0', 'id_ID').format(destinationData.price)},-",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
