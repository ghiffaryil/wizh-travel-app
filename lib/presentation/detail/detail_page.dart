import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wizhapp/models/list_destination_response_model.dart';

class DetailPage extends StatefulWidget {
  final ListDestinationData destinationData;

  const DetailPage({super.key, required this.destinationData});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  void setfavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    print("Is Favorite $isFavorite");
  }

  @override
  Widget build(BuildContext context) {
    var destinationData = widget.destinationData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          destinationData.title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                animateToClosest: true,
                viewportFraction: 0.95,
                initialPage: 0,
                height: MediaQuery.of(context).size.height * 0.23,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                autoPlay: false,
              ),
              items:
                  destinationData.images.map((lsitImages) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              lsitImages.url,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.23,
                              width: double.infinity,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.23,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destinationData.title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(flex: 2),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 20, color: Colors.amber),
                            Text(
                              "${destinationData.rating.toString()}/5 ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setfavorite();
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Location : ${destinationData.location}',
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 5),
                  Text(
                    destinationData.description,
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 5),
                  Text(
                    "Rp ${NumberFormat('#,##0', 'id_ID').format(destinationData.price + destinationData.tax)},-",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 102, 7),
                    ),
                  ),

                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Include Tax : ',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 67, 65, 65),
                        ),
                      ),
                      Text(
                        "Rp ${NumberFormat('#,##0', 'id_ID').format(destinationData.tax)},-",
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 67, 65, 65),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: Text(
                      'Available : ${destinationData.totalPaxAvailable} Pax',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: destinationData.reviews.length,
                      itemBuilder: (context, index) {
                        var reviewData = destinationData.reviews[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.78,
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    reviewData.user,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              Text(
                                reviewData.comment,
                                style: TextStyle(fontSize: 15),
                              ),

                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text(
                                    " ${reviewData.rating.toString()}/5",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      'Terms & Condition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      'The services provided by Ongis Travel have the following terms and conditions:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      '1. Registration down payment is at least 50% of the tour fee\n'
                      '2. Participants are willing to fulfill the completeness of the document requirements requested by Ongis Travel, such as a valid KTP or identity card for insurance purposes\n'
                      '3. Registration without a down payment is not binding and can be canceled without prior notification to the participant\n'
                      '4. Payment of tour fees is due on the tour day at the latest\n'
                      '5. Applicants who are over 70 years old, or have physical/mental limitations, must be accompanied by a family member/friend/relative of the participant during the tour\n'
                      '6. If there is a special contract/agreement agreed upon by the tour participants and Ongis Travel, then the registration down payment, payment and other applicable terms can be adjusted to the contract/agreement',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.lightGreen,
                          size: 60,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your destination has been successfully booked!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Book Now', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
