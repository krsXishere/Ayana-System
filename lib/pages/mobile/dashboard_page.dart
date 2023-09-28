import 'dart:async';
import 'package:ayana_system_admin/common/theme.dart';
import 'package:ayana_system_admin/pages/mobile/gudang_page.dart';
import 'package:ayana_system_admin/widgets/button_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TooltipBehavior tooltipProfit;
  bool clicked = false;
  Timer? timer;

  @override
  void initState() {
    tooltipProfit = TooltipBehavior(
      enable: true,
      textStyle: primaryTextStyle.copyWith(
        color: white,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 10),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: statusAppbarColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: statusAppbarColor,
          elevation: 0,
          title: GestureDetector(
            onTap: () {
              setState(() {
                clicked = !clicked;
              });
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              width: clicked ? 250 : 80,
              height: 30,
              decoration: BoxDecoration(
                color: clicked ? secondaryGreen : white,
                borderRadius: BorderRadius.circular(15),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              child: Text(
                clicked ? "Ayana System" : "Ayana",
                style: primaryTextStyle.copyWith(
                  color: clicked ? white : secondaryGreen,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: secondaryGreen,
                child: Icon(
                  Icons.person,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GridView.count(
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ButtonGridWidget(
                      icon: Icons.warehouse_rounded,
                      text: "Gudang",
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const GudangPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    ButtonGridWidget(
                      icon: Icons.money,
                      text: "Keuangan",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: SfCartesianChart(
                    onTooltipRender: (TooltipArgs args) {
                      args.header = "Bouqet Terjual";
                    },
                    tooltipBehavior: tooltipProfit,
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    series: <ChartSeries>[
                      SplineAreaSeries<SalesData, String>(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            secondaryGreen,
                            white,
                          ],
                        ),
                        enableTooltip: true,
                        borderWidth: 5,
                        splineType: SplineType.clamped,
                        borderColor: primaryGreen,
                        color: secondaryGreen,
                        dataSource: getColumnData(),
                        xValueMapper: (SalesData sales, _) => sales.x,
                        yValueMapper: (SalesData sales, _) => sales.y,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  String x;
  double y;

  SalesData(
    this.x,
    this.y,
  );
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    // SalesData("Des", 20),
    SalesData("Jan", 20),
    SalesData("Feb", 25),
    SalesData("Mar", 22),
    SalesData("Jun", 21),
    SalesData("Jul", 30),
    SalesData("Agu", 28),
    SalesData("Sep", 30),
    SalesData("Okt", 27),
    SalesData("Nov", 18),
    SalesData("Des", 20),
  ];

  return columnData;
}
