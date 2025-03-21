import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wizhapp/constant/component/shimmer/shimmer_card.dart';
import 'package:wizhapp/models/list_destination_response_model.dart';
import 'package:wizhapp/presentation/detail/detail_page.dart';

class PrivateTripList extends StatefulWidget {
  const PrivateTripList({super.key});

  @override
  State<PrivateTripList> createState() => _PrivateTripListState();
}

class _PrivateTripListState extends State<PrivateTripList> {
  final List<ListDestinationData> data = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
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
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var destinationData = data[index];
        return Container(
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
              SizedBox(
                child: InkWell(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.network(
                          destinationData.thumbnail,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.212,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return shimmerCard(context, 0.212);
                          },
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            color: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              "Private Trip",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destinationData.location,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines:
                                            1, // Tambahkan maxLines untuk mencegah overflow
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "Rp ${NumberFormat('#,##0', 'id_ID').format(destinationData.price)},-",
                                        style: const TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 13,
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          154,
                                          59,
                                        ),
                                      ),
                                      Text(
                                        " ${destinationData.rating.toString()} ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
