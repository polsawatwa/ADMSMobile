import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Image.asset(
                    'assets/imageT1.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'คอลเลกชันยอดนิยม',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/imageT1.jpg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'title',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'sub',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'คอลเลกชันใหม่',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Card 1
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/imageT1.jpg',
                                width: double.infinity,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title 1',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Prompt',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Subtitle 1',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Prompt',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Card 2
                      SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/imageT1.jpg',
                                width: double.infinity,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title 2',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Prompt',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Subtitle 2',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Prompt',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Card 3
                      SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/imageT1.jpg',
                                width: double.infinity,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title 3',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Prompt',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Subtitle 3',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Prompt',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
