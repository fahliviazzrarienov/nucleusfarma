import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../config/pallete.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  AppBar _appBar = AppBar(elevation: 0,
      backgroundColor: PaletteLogin.palatinate_blue,
      // title: Text('Dashboard'),
      // leading: DropdownMenuItem(child:Icon(Icons.menu), ),
      // iconTheme: IconThemeData(size: 30, color: Colors.white),
      actions: [Icon(Icons.notifications_none_outlined,),]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  PaletteLogin.palatinate_blue,
                  PaletteLogin.yale_blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: ListView(
            children: [
              SizedBox(height: 10,),
              _onside(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    _productsalestile(),
                    _archivementtile(),
                    SizedBox(height: 80,)
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }


  _onside(){
    return Container(
      height: 100,
      child: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 5,),
            _onsidetile(firstcolor: PalleteDashboard.tufts_blue, secondcolor: PaletteLogin.yale_blue),
            SizedBox(width: 20,),
            _onsidetile(firstcolor: PalleteDashboard.urobilin, secondcolor: PalleteDashboard.smashed_pumpkin,),
            SizedBox(width: 20,),
            _onsidetile(firstcolor: PalleteDashboard.turquoise, secondcolor: PalleteDashboard.emerald,),
            SizedBox(width: 20,),
          ],
        ),
      )
    );
  }

  _onsidetile({firstcolor, secondcolor}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              width: 8,
              height: 36,
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  firstcolor,
                  secondcolor!
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
                child: Column(
              children: [
                Text('Target Penjualan Bulanan ', style: TextStyle(fontSize: 14),),
                SizedBox(height: 4,),
                Row(children: [
                  Text('Rp8.000.000/', style: TextStyle(fontSize: 18),),
                  Text('15.000.000', style: TextStyle(fontSize: 10),),

                ],)
              ],
            ))
          ],
        ),
      ),
    );
  }

  // _bottomtile(){
  //   return Container(
  //     child: ,
  //   );
  // }

  _productsalestile(){
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity, child:Text('Product Sales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), ),),
          Center(
            child: SfCircularChart(
              legend: Legend(
                  isVisible: true,
                  orientation: LegendItemOrientation.horizontal,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom),
                series: <CircularSeries>[
                  DoughnutSeries<ChartData_product, String>(
                    dataSource: chartData_product,
                    pointColorMapper:(ChartData_product data,  _) => data.color,
                    xValueMapper: (ChartData_product data, _) => data.x,
                    yValueMapper: (ChartData_product data, _) => data.y,
                    dataLabelSettings:  DataLabelSettings( isVisible: true),
                  )
                ]
            ))
        ],
      ),
    );
  }

  _archivementtile(){
    ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.grey
    );
    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity, child:Text('Archivement', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), ),),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: SfCartesianChart(
                    zoomPanBehavior: _zoomPanBehavior,
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      SplineSeries<ChartData_achive, String>(
                          dataSource: chartData_archievement,
                    animationDuration: 1000,
                          markerSettings: MarkerSettings(isVisible: true, color: Colors.yellow),
                          xValueMapper: (ChartData_achive data, _) => data.x,
                          yValueMapper: (ChartData_achive data, _) => data.y
                      )
                    ]
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  final List<ChartData_achive> chartData_archievement = [
    ChartData_achive('Jan', 21),
    ChartData_achive('Feb', 24),
    ChartData_achive('Mar', 35),
    ChartData_achive('Apr', 38),
    ChartData_achive('May', 54),
    ChartData_achive('Jun', 21),
    ChartData_achive('Jul', 24),
    ChartData_achive('Aug', 35),
    ChartData_achive('Sep', 38),
    ChartData_achive('Oct', 54),
    ChartData_achive('Nov', 38),
    ChartData_achive('Dec', 54),
  ];
  final List<ChartData_product> chartData_product = [
    ChartData_product('Onoiwa Capsule', 10, PalleteDashboard.tufts_blue),
    ChartData_product('Onoiwa Plus', 5, PalleteDashboard.cornflower_blue),
    ChartData_product('Onoiwa Mix', 15, PalleteDashboard.midnight),
    ChartData_product('Onogate', 20, PalleteDashboard.flame),
    ChartData_product('Onoake', 20, PalleteDashboard.spanish_green),
    ChartData_product('Rafa Khomsa', 25, PalleteDashboard.dark_pring_green),
    ChartData_product('Onogra', 5, PalleteDashboard.red_pigment),
  ];

}




class ChartData_achive {
  ChartData_achive(this.x, this.y);
  final String x;
  final double? y;
}

class ChartData_product {
  ChartData_product(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
