import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewScreen extends StatelessWidget {
  const SearchViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0.8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    // controller: 'textEditingController',
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset('assets/splash/search.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(0.8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.open_with_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
