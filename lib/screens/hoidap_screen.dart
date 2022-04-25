import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';

class HoiDapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FAQPageState();
  }
}

class FAQPageState extends State<HoiDapScreen> {
  bool isFAQLoading = false;
  bool isExpand = false;
  var selected;

  final CauHoi = [
    'Covid-19 là gì ?',
    'Định nghĩa F0 là gì ?',
    'Định nghĩa F1 là gì ?',
    'Covid 19 lây lan như thế nào ?',
    'Các biện pháp phòng ngừa Covid 19 ?',
    'Các triệu chứng thường gặp Covid 19 ?',
    'Tự chăm sóc khi mắc Covid 19',
    'Khi nào thì cần cấp cứu y tế khi mắc Covid 19 ?',
    'Hậu Covid là gì ?',
    'Khi nào cần điều trị hậu Covid ?',
  ];
  final CauTraLoi = [
    '   Là người có kết quả xét nghiệm dương tính với virus SARS-CoV-2 bằng phương pháp phát hiện vật liệu di truyền của virus (PCR). \n   Là người tiếp xúc gần (F1) và có kết quả xét nghiệm nhanh kháng nguyên dương tính với virus SARS-CoV-2.\nLà người có biểu hiện lâm sàng nghĩ mắc COVID-19 (ca bệnh nghi ngờ và có kết quả xét nghiệm nhanh kháng nguyên dương tính với vi rút SARS-CoV-2 và có yếu tố dịch tễ (không bao gồm F1).]\n   Là người có kết quả xét nghiệm nhanh kháng nguyên dương tính 2 lần liên tiếp (xét nghiệm lần 2 trong vòng 8 giờ kể từ khi có kết quả xét nghiệm lần 1 với virus SARS-CoV-2 và có yếu tố dịch tễ (không bao gồm F1)',
    '   Người có tiếp xúc cơ thể trực tiếp (bắt tay, ôm, hôn, tiếp xúc trực tiếp dưới da, cơ thể...) với F0 trong thời kỳ lây truyền của F0.\n   Người đeo khẩu trang có tiếp xúc, giao tiếp trong vòng 2 mét hoặc trong cùng không gian hẹp, kín và tối thiểu trong thời gian 15 phút với ca bệnh xác định (F0) khi đang trong thời kỳ lây truyền của F0.\n   Người không đeo khẩu trang có tiếp xúc, giao tiếp gần trong vòng 2 mét hoặc ở trong cùng không gian hẹp, kín với F0 trong thời kỳ lây truyền của F0.\n- Người trực tiếp chăm sóc, khám và điều trị ca bệnh xác định (F0) khi đang trong thời kỳ lây truyền của F0 mà không sử dụng đầy đủ các phương tiện phòng hộ cá nhân (PPE)',
    '   COVID-19 là bệnh do vi-rút có tên là SARS-CoV-2 gây ra. Hầu hết mọi người mắc bệnh COVID-19 đều có các triệu chứng nhẹ, nhưng một số người có thể bị bệnh nặng. Người cao tuổi và những người có các tình trạng bệnh nền nhất định có nhiều khả năng mắc bệnh nghiêm trọng. Tình trạng hậu COVID là một loạt các vấn đề sức khỏe mà mọi người có thể gặp phải bốn tuần trở lên sau lần đầu tiên mắc bệnh COVID-19. Ngay cả những người không bị bệnh nặng do COVID-19 cũng có thể gặp phải tình trạng hậu COVID.',
    '   Hít vào không khí khi ở gần người bị nhiễm bệnh đang thở ra những giọt nhỏ và các hạt có chứa vi-rút. \n   Để những giọt nhỏ và các hạt có chứa vi-rút rơi vào mắt, mũi hoặc miệng, đặc biệt là thông qua sự bắn tóe và tia xịt như ho hoặc hắt hơi.\n   Chạm vào mắt, mũi hoặc miệng bằng tay có vi-rút trên đó.',
    'Giữ khoảng cách an toàn với người khác (ít nhất 1 mét), kể cả khi họ không có biểu hiện bệnh.\nĐeo khẩu trang ở nơi công cộng, nhất là khi ở trong nhà hoặc khi không thể giữ khoảng cách.\nChọn những không gian mở, thông thoáng thay vì những không gian kín. Mở cửa sổ nếu ở trong nhà.\nThường xuyên rửa tay. Dùng xà phòng và nước hoặc dung dịch rửa tay chứa cồn.\nTiêm vaccine khi đến lượt. Tuân thủ chỉ dẫn của địa phương về việc tiêm vaccine.\nKhi ho hoặc hắt hơi, hãy che mũi và miệng bằng khăn giấy hoặc khuỷu tay.\nỞ nhà khi bạn cảm thấy không khỏe.',
    'Các triệu chứng thường gặp nhất:sốt, ho, mệt mỏi, mất vị giác hoặc khứu giác\nCác triệu chứng ít gặp hơn: đau họng, đau đầu, đau nhức, tiêu chảy, da nổi mẩn hay ngón tay hoặc ngón chân bị tấy đỏ hoặc tím tái, mắt đỏ hoặc ngứa',
    '– Có thể tự chăm sóc bản thân như ăn uống, giặt quần áo, vệ sinh cá nhân…\n– Biết cách đo thân nhiệt.\n– Có khả năng liên lạc với nhân viên y tế để được theo dõi, giám sát. Khi có tình trạng cấp cứu, có sẵn và sử dụng được các phương tiện liên lạc như điện thoại, máy tính…\n– Có khả năng tự dùng thuốc theo đơn thuốc (toa) của bác sỹ',
    '- Khó thở, thở hụt hơi, hoặc ở trẻ em có dấu hiệu thở bất thường: thở rên, rút lõm lồng ngực, phập phồng cánh mũi, khò khè, thở rít thì hít vào.\n- Nhịp thở tăng: Người lớn nhịp thở >21 lần/phút; Trẻ từ đến dưới 5 tuổi nhịp thở: ≥40 lần/phút; Trẻ từ 5- dưới 12 tuổi: nhịp thở ≥ 30 lần/phút.\n- SpO2 < 96%; mạch nhanh > 120 nhịp/phút hoặc dưới 50 lần/phút; Huyết áp thấp: huyết áp tối đa < 90 mmHg, huyết áp tối thiểu < 60 mmHg.\n- Đau tức ngực thường xuyên, cảm giác bó thắt ngực, đau tăng khi hít sâu.\n- Thay đổi ý thức: Lú lẫn, ngủ rũ, lơ mơ, rất mệt/mệt lả, trẻ quấy khóc, li bì khó đánh thức, co giật.\n- Tím môi, tím đầu móng tay, móng chân, da xanh, môi nhợt, lạnh đầu ngón tay, ngón chân.\n- Không thể uống. Trẻ em bú kém/giảm, ăn kém, nôn.\n- Trẻ có biểu hiện: Sốt cao, đỏ mắt, môi đỏ, lưỡi đỏ, ngón tay chân sưng phù nổi ban đỏ, nốt hoặc mảng xuất huyết...',
    'Theo đó, tình trạng hậu COVID-19 xảy ra ở những người có tiền sử nhiễm bệnh với các triệu chứng và kéo dài ít nhất 2 tháng mà không thể giải thích bằng chẩn đoán thay thế. Tình trạng này có thể khiến sức khỏe người bệnh bị suy giảm kéo dài, có tác động nghiêm trọng đến khả năng quay trở lại làm việc hoặc tham gia cuộc sống xã hội. Hậu COVID-19 ảnh hưởng đến sức khỏe tâm thần thể chất và có thể gây ra những hậu quả kinh tế đáng kể cho bản thân, gia đình và cho xã hội.',
    'Người nhiễm COVID-19 nhiều tuần đến nhiều tháng sau khi khỏi bệnh vẫn còn đối mặt với hàng loạt triệu chứng và di chứng kéo dài như sốt nhẹ, khó thở, ho kéo dài, mệt mỏi, đau cơ, khớp, rụng tóc, xơ phổi, tim đập nhanh hoặc đánh trống ngực, rối loạn nội tiết, huyết học bị huyết khối… Có trường hợp xuất hiện rối loạn tiêu hóa (ăn không ngon miệng, chán ăn, đau dạ dày, tiêu chảy…), rối loạn vị giác hoặc khứu giác, phát ban…\nNgười bệnh trong giai đoạn hậu COVID-19 cũng có thể gặp các triệu chứng về tâm thần kinh như rối loạn tâm lý, giảm sự tập trung, lo âu, trầm cảm, bồn chồn, rối loạn giấc ngủ, mau quên, không tập trung. Thường xuất hiện tình trạng não sương mù, nhận thức kém, đọc chậm, giảm trí nhớ ngắn hạn, thay đổi tâm trạng.Với người có sẵn bệnh nền như bệnh tim mạch, tiểu đường, đặc biệt là hô hấp, viêm phổi tắc nghẽn mạn tính COPD, viêm phế quản mạn… khi COVID-19 xảy ra trên nền bệnh đó có thể khiến tổn thương vốn có của họ trở nên nặng hơn.',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpand = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      // appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/bacsihoidap.png'),
                    Text(
                      'Hỏi ngắn - đáp nhanh',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1000.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                    key: Key('builder ${selected.toString()}'),
                    itemCount: CauHoi.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Container(
                          child: Card(
                            elevation: 0,
                            shadowColor: Colors.grey,
                            margin: EdgeInsets.only(bottom: 0, top: 0),
                            child: ExpansionTile(
                                //leading: Text(),
                                key: Key(index.toString()),
                                backgroundColor: Colors.pink[50],
                                initiallyExpanded: index == selected,
                                iconColor: Colors.grey,
                                title: Text(
                                  CauHoi[index],
                                  style: TextStyle(
                                      color: Color(0xFF444444),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 0.0,
                                          bottom: 10,
                                          left: 17,
                                          right: 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                CauTraLoi[index],
                                                style: TextStyle(
                                                  color: Color(0xFF444444),
                                                  fontSize: 13,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                                onExpansionChanged: ((newState) {
                                  isExpand = newState;
                                  print(newState);
                                  if (newState)
                                    setState(() {
                                      //  Duration(milliseconds: 100);
                                      selected = index;
                                      // isExpand=newState;
                                    });
                                  else
                                    setState(() {
                                      selected = -1;
                                      // isExpand=newState;
                                    });
                                  print(selected);
                                })),
                          ),
                        ),
                      ]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
