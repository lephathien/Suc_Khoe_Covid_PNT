import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}

class ListViewHome extends State<VideoScreen> {
  final TitleVideo = [
    "Phân biệt bệnh Covid 19 với cảm cúm, cảm lạnh",
    "Hướng dẫn tự lấy mẫu xét nghiệm Covid 19 tại nhà",
    'Theo dõi các triệu chứng bệnh Covid 19 tại nhà',
    'Cách giảm các triệu chứng Covid 19 không dùng thuốc',
    'Cung cấp dinh dưỡng cho F0, F1 tại nhà',
    'Khi nào cần phải nhập viện khi nhiễm Covid 19',
    'Theo dõi phản ứng sau khi tiêm vacxin Covdi 19',
    'Hướng dẫn tập thở và vận động khi mắc Covid 19',
    'Hướng dẫn sử dụng thuốc điều trị Covid 19 tại nhà',
    'Hướng dẫn sử dụng thuốc kháng virus Covid 19',
    'Hướng dẫn khi nào đi khám hậu Covid 19',
    'Hướng dẫn chăm sóc sức khỏe hậu Covid 19',
    'Hướng dẫn chăm sóc trẻ em hậu Covid 19 :',
  ];

  final LinkVideo = [
    "L1VP_wYNNUU",
    "kMIOZS03774",
    'y0bR00k7SDc',
    '1chi4cxxACc',
    '-2ZduPnLdWE',
    'XAV0YIirMmA',
    'xXtfOjAKoIw',
    'N52NMa8cZXM',
    'nFGaf_Dqm0g',
    'AIO9tIjSubE',
    '2o8ysROsOVs',
    'cV5_kKVDXo8',
    '_vIRppgLPGE',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/bacsivideo.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Video hướng dẫn về Covid 19 ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 750.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: ListView.builder(
                    //padding: const EdgeInsets.only(top: 20),
                    itemCount: TitleVideo.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              // ListTile( title: Text("Lịch sử Đoàn TN cộng sản Hồ Chí Minh")),
                              Text(
                                TitleVideo[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: YoutubePlayer(
                                                  controller:
                                                      YoutubePlayerController(
                                                          initialVideoId:
                                                              LinkVideo[index],
                                                          flags:
                                                              YoutubePlayerFlags(
                                                            autoPlay: true,
                                                            mute: false,
                                                          )),
                                                  showVideoProgressIndicator:
                                                      true,
                                                  progressIndicatorColor:
                                                      Colors.blueAccent,
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Image.network(
                                      'https://img.youtube.com/vi/' +
                                          LinkVideo[index] +
                                          '/0.jpg',
                                      width: size.width,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
