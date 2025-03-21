import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wizhapp/constant/component/shimmer/shimmer_card.dart';
import 'package:wizhapp/models/list_destination_response_model.dart';
import 'package:intl/intl.dart';
import 'package:wizhapp/presentation/detail/detail_page.dart';

class ListDestinationSection extends StatefulWidget {
  const ListDestinationSection({super.key});

  @override
  State<ListDestinationSection> createState() => _ListDestinationSectionState();
}

class _ListDestinationSectionState extends State<ListDestinationSection> {
  final List<ListDestinationData> data = [];
  final List<bool> isFavorite = [];
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
      isFavorite.addAll(
        List.generate(responseModel.data.length, (index) => false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            var destinationData = data[index];
            return Container(
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
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            destinationData.thumbnail,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.12,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return shimmerCard(context, 0.12);
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Promo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.all(2.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      destinationData.title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isFavorite[index] =
                                              !isFavorite[index];
                                        });
                                      },
                                      child: Icon(
                                        isFavorite[index]
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
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
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        154,
                                        59,
                                      ),
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
                  ],
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.82,
            crossAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
