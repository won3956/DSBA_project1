import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const CustomChoiceChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Color(0xFF1A4D2E) : Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onSelected,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? Color(0xFF1A4D2E) : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPerson = '김순자 할머니';

  final Map<String, Map<String, dynamic>> personData = {
    '김순자 할머니': {
      'analysis': '김순자님의 5월 분석 결과',
      'alert': '주의가 필요합니다!',
      'graph': 'assets/graph.jpg',
      'reportTitle': '5월 김순자 할머니 리포트',
      'summary': '그래프가 상승하고 있어요!',
      'report':
      '김순자 할머니의 이번 주 치매 위험 최고 점수는 83점으로, 지난주에 비해 상승했으며 심각한 중증 치매에 근접한 수치입니다. 최근 대화에서 단어 반복과 말의 속도 저하, 과거 기억 회상의 어려움이 두드러지며 중증 치매 단계로의 진입 가능성이 높아졌습니다. 이러한 변화는 인지 기능 저하의 신호로 판단되며, 특히 언어 유창성과 반응 속도에서 뚜렷한 저하가 감지됩니다. 일상 속 대화 자극을 늘리고, 사진이나 일기 등을 활용해 회상 대화를 시도하는 것이 도움이 됩니다. 동시에 규칙적인 생활 습관과 인지 자극 활동을 병행하면 진행 속도를 늦추는 데 효과적입니다. 지속적인 관찰과 함께 필요 시 전문 진료도 고려할 시점입니다.',
    },
    '박춘배 할아버지': {
      'analysis': '박춘배님의 5월 분석 결과',
      'alert': '양호한 상태입니다.',
      'graph': 'assets/graph2.jpg',
      'reportTitle': '5월 박춘배 할아버지 리포트',
      'summary': '그래프가 안정적이에요!',
      'report':
      '박춘배 할아버지의 이번 주 치매 위험 최고 점수는 42점으로, 비교적 안정적인 상태를 유지하고 있습니다. 대화 내용에서도 명확한 발음과 일관된 문장 구성이 유지되고 있으며, 기억력도 양호한 편입니다. 현재 상태를 유지하기 위해서는 지속적인 언어 자극과 규칙적인 일상 생활이 중요합니다. 주기적인 대화와 함께 가벼운 신체 활동을 병행하면 인지 기능 유지에 도움이 됩니다.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = personData[selectedPerson]!;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFFFFFFF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            child: AppBar(
              backgroundColor: Color(0xFFFFFFFF),
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              title: Container(
                color: Color(0xFFFFFFFF),
                child: Image.asset(
                  'assets/logo2.png',
                  height: 30,
                ),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: personData.keys.map((person) {
                            return CustomChoiceChip(
                              label: person,
                              selected: selectedPerson == person,
                              onSelected: () {
                                setState(() {
                                  selectedPerson = person;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              data['analysis'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '치매 위험 지수',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: data['alert'] == '주의가 필요합니다!'
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      data['alert'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  data['graph'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['reportTitle'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 9),
                              Text(
                                data['summary'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 9),
                              Text(
                                data['report'],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFFFFFFF),
          currentIndex: 0,
          onTap: (index) {
            // 탭 클릭 시 로직
          },
          selectedItemColor: Color(0xFF1A4D2E),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '알림',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ),
      ),
    );
  }
}
