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
                padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Image.network(
                    'https://img.freepik.com/free-photo/landmark-pagoda-doi-inthanon-national-park-chiang-mai-thailand_335224-779.jpg?w=1060&t=st=1677748491~exp=1677749091~hmac=43a293e6df1690c4723539b4a117e7f50f9567da7bbf91c7a08bde1217cd3fe3',
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
                        Image.network(
                          'https://www.chillnaid.com/wp-content/uploads/2018/09/%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%98%E0%B8%B2%E0%B8%95%E0%B8%B8%E0%B8%9C%E0%B8%B2%E0%B8%8B%E0%B9%88%E0%B8%AD%E0%B8%99%E0%B9%81%E0%B8%81%E0%B9%89%E0%B8%A7-1.jpg',
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
                        Image.network(
                          'https://inwfile.com/s-di/0mrq2i.jpg',
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
                        Image.network(
                          'https://inwfile.com/s-di/0mrq2i.jpg',
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
                        Image.network(
                          'https://inwfile.com/s-di/0mrq2i.jpg',
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
