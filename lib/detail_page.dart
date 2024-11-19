import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  final String badge, logo, id, team, country, stadium, description;

  const Detailpage(
      {super.key,
        required this.badge,
        required this.logo,
        required this.id,
        required this.team,
        required this.country,
        required this.stadium,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 25),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 35)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.network(
                      badge,
                      height: 300,
                      width: 300,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 250,
                        ),
                        Image.network(
                          logo,
                          height: 200,
                          width: 300,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(id),
              Text(team, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 23),),
              Text(country, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 23)),
              Text(stadium, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 23)),
              const Text("Description : ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
