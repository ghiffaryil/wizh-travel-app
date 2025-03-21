import 'package:flutter/material.dart';
import 'package:wizhapp/constant/style/style_colors.dart';

import 'package:wizhapp/presentation/home/widgets/private_trip/list_private_trip.dart';

class PrivateTripSection extends StatefulWidget {
  const PrivateTripSection({super.key});

  @override
  State<PrivateTripSection> createState() => _PrivateTripSectionState();
}

class _PrivateTripSectionState extends State<PrivateTripSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          // color: AppColors.alternative,
          image: DecorationImage(
            image: AssetImage("assets/img/background/batik2.jpg"),
            fit: BoxFit.cover,
            opacity: 0.98,
          ),
        ),

        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: AppColors.alternative.withValues(alpha: 0.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Want to Private Trip?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Let\'s Register Now!! ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: PrivateTripList(),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
