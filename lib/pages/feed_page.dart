import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class testApp extends StatefulWidget {
  const testApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<testApp> {
  final images = [
    "lib/assets/images/testpng1.png",
    "lib/assets/images/testpng2.png",
    "lib/assets/images/testpng3.png",
    "lib/assets/images/testpng4.png",
    "lib/assets/images/testpng5.png",
  ];
  int activeIndex = 0;
  bool isLike = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Image.network(
                  'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
                  width: 30,
                  height: 30,
                  ),
                SizedBox(width: 4.0,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Instagram',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                        Image.network(
                          //公式マーク
                          'https://thumb.ac-illust.com/27/27a4a9867de17cedf9b36eb34f02d8b7_t.jpeg',
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                    Text('サンディエゴ',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                      onPressed: () {}, 
                      child: Text('•••'),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                ],
              ),
            ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  initialPage: 0,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) => setState(() {
                    activeIndex = index;
                  }),
                ),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final path = images[index];
                  return buildImage(path, index);
                },
              ),
              const SizedBox(height: 20),
              buildIndicator(),

              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                 
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            icon: Icon(
                              isLike ? Icons.favorite : Icons.favorite_border,
                              color: isLike ? Colors.red : null,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                             child: Icon(
                              Icons.chat_bubble,
                              color:  Colors.black,
                              ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {},
                             child: Icon(
                              Icons.send,
                              color:  Colors.black,
                              ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        const Spacer(),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                            });
                          },
                          icon: Icon(
                            isLike ? Icons.favorite : Icons.favorite_border,
                            color: isLike ? Colors.red : null,
                          ),
                        ),
                      Image.network('https://www.marketing-technology.jp/hubfs/Imported_Blog_Media/instagram-collection-1-Apr-19-2022-03-54-22-86-AM-1.jpg',
                  width: 30,
                  height:30,
                  ),
                       
                        ],
 
                       
                       
                       
                       
                      ),
                   
                   
                    Align(
                      alignment:Alignment.centerLeft,
                      child: Text('「いいね!」744,899件',
                      style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                    ),
 
 
 
                        Text('texttexttexttexttexttexttexttexttexttexttextexttexttextexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttextttexttexttexttexttexttexttexttexttexttexttexttexttextttexttetexttexttexttexttexttexttexttextxttexttexttexttext',
                    style: TextStyle(
                         fontSize: 12,
                        ),
                        ),
                     
                     
                     
                    ],
 
 
                   
                   
                  ),
                 
                 
                )
            ],
          ),
        ),
      );

  Widget buildImage(path, index) => Container(
        //画像間の隙間
        margin: const EdgeInsets.symmetric(horizontal: 13),
        color: Colors.grey,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        //エフェクトはドキュメントを見た方がわかりやすい
        effect: const JumpingDotEffect(
            dotHeight: 20,
            dotWidth: 20,
            activeDotColor: Colors.green,
            dotColor: Colors.black12),
      );
}
