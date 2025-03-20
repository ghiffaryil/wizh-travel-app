// To parse this JSON data, do
//
//     final listDestinationResponseModel = listDestinationResponseModelFromJson(jsonString);

import 'dart:convert';

ListDestinationResponseModel listDestinationResponseModelFromJson(String str) =>
    ListDestinationResponseModel.fromJson(json.decode(str));

String listDestinationResponseModelToJson(ListDestinationResponseModel data) =>
    json.encode(data.toJson());

class ListDestinationResponseModel {
  String status;
  List<ListDestinationData> data;

  ListDestinationResponseModel({required this.status, required this.data});

  factory ListDestinationResponseModel.fromJson(Map<String, dynamic> json) =>
      ListDestinationResponseModel(
        status: json["status"],
        data: List<ListDestinationData>.from(
          json["data"].map((x) => ListDestinationData.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ListDestinationData {
  String title;
  String description;
  String location;
  int price;
  int tax;
  int totalPaxAvailable;
  String thumbnail;
  double rating;
  List<Review> reviews;
  List<Images> images;

  ListDestinationData({
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.tax,
    required this.totalPaxAvailable,
    required this.thumbnail,
    required this.rating,
    required this.reviews,
    required this.images,
  });

  factory ListDestinationData.fromJson(
    Map<String, dynamic> json,
  ) => ListDestinationData(
    title: json["title"],
    description: json["description"],
    location: json["location"],
    price: json["price"],
    tax: json["tax"],
    totalPaxAvailable: json["total_pax_available"],
    thumbnail: json["thumbnail"],
    rating: json["rating"]?.toDouble(),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "location": location,
    "price": price,
    "tax": tax,
    "total_pax_available": totalPaxAvailable,
    "thumbnail": thumbnail,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Review {
  String user;
  String comment;
  int rating;

  Review({required this.user, required this.comment, required this.rating});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    user: json["user"],
    comment: json["comment"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "comment": comment,
    "rating": rating,
  };
}

class Images {
  String url;

  Images({required this.url});

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(url: json["url"]);

  Map<String, dynamic> toJson() => {"url": url};
}
