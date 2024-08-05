import 'dart:convert';

import 'package:favorite_place_jhonny_mustafa/models/user_login.dart';
import 'package:favorite_place_jhonny_mustafa/providers/data_provider.dart';
import 'package:favorite_place_jhonny_mustafa/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final UserLogin user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Flutter favorite place'),
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const AddPlace(),
    //             ),
    //           );
    //         },
    //         icon: const Icon(Icons.add),
    //       ),
    //     ],
    //   ),
    //   body: ListView(
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     children: [
    //       Text(widget.user.name.toString()),
    //     ],
    //   ),
    // );

    return Consumer<DataProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text('My Favorite Place'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPlace(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: value.favPlaceItem.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: value.favPlaceItem.length,
                  padding: const EdgeInsets.only(bottom: 70),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Hero(
                            tag: value.favPlaceItem[index].image!,
                            transitionOnUserGestures: true,
                            child: Container(
                              height: 300,
                              margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(
                                      value.favPlaceItem[index].image!)),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
    );
  }
}
