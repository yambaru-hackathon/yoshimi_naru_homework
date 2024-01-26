import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final images = [
    'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
    'https://1.bp.blogspot.com/-Z9SNQ5KVbtg/X8XMaj5ASZI/AAAAAAABciI/EGYN8WsU5ScHrDfKhRtmGtYTkurMCz8VACNcBGAsYHQ/s875/omairi_mask_man.png',
    'https://3.bp.blogspot.com/-ZMrpdt1m_0w/XCQhF0FK6TI/AAAAAAABQ6U/pbbsQXyXetM_0O8KNzsVe_810K0L9j-AACLcBGAs/s800/saisenbako_qr.png',
    'https://3.bp.blogspot.com/-d2L3hyx3JTU/WzC92mKYt1I/AAAAAAABM8Y/s76v5v1piCMN0eKy9jUEQlLHhCQcfmHMwCLcBGAs/s800/omatsuri_hashigonori.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
              Image.network(
                'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
                width: 60,
                height: 60,
                ),
              const Spacer(),
              const Column(
                children: [
                  Text(
                    '7041', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('投稿'),
                ],
              ),
              const Column(
                children: [
                  Text('4.6億', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('フォロワー'),
                ],
              ),
              const Column(
                children: [
                  Text('99', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('フォロー中'),
                ],
              ),
                        ],),
            ),
          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instagram', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '#YoursToMake', 
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'help.instagram.com', 
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'フォロー中',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ), 
                        ),
                      ),
                      const SizedBox(width: 4,),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'メッセージ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ), 
                        ),
                      ), 
                  
                    ],
                  ),
                ), 
                const SizedBox(width: 4,),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down, 
                    color: Colors.black,
                  ), 
                ), 
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisCount: 3,
            children: images.map((imageUrl) {
              return InstagramPostItem(imageUrl: imageUrl);
            }).toList(),
          ),
          ],
        ),
      ),
    );
  }
}


class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}