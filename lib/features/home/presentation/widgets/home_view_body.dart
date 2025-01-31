import 'dart:ui';

import 'package:cinema_hub/constants.dart';
import 'package:cinema_hub/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Hello ', style: Styles.titleSemiBold),
                          TextSpan(text: 'Daizy!', style: Styles.titlelight),
                        ],
                      ),
                    ),
                    const Text('Check for latest addition.',
                        style: Styles.titleMedium14),
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/daizy.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Smaller Search Bar
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                decoration: ShapeDecoration(
                  color: const Color(0x1E767680),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: Styles.titleMedium14,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 1,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.mic,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text('Filters', style: Styles.titleMedium18),
            const SizedBox(height: 10),
            // Centered Filters
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFilterItem(Icons.movie_filter, "Genre"),
                  _buildFilterItem(Icons.star_rate, "Top IMDB"),
                  _buildFilterItem(Icons.language, "Language"),
                  _buildFilterItem(Icons.visibility, "Watched"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Featured ', style: Styles.titleMedium24),
                  TextSpan(text: 'Series', style: Styles.titlelight),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Horizontal Scrollable Featured Series
            SizedBox(
              height: 310,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Replace with your actual data length
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 209.18,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF51535D),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://via.placeholder.com/209x309"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.78),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: kPrimaryColor,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, true),
            _buildNavItem(Icons.search, false),
            _buildNavItem(Icons.favorite, false),
            _buildNavItem(Icons.person, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white60,
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

Widget _buildFilterItem(IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: ShapeDecoration(
            color: const Color(0xFF51535D),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: Styles.titleMedium12),
      ],
    ),
  );
}
