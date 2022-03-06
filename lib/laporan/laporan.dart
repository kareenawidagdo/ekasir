import 'package:cashier/controller/transaksicontroller.dart';
import 'package:cashier/manage/formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  TransaksiController t = Get.put(TransaksiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            "Laporan",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Total Penjualan :', style: TextStyle(fontSize: 14.0)),
              GetBuilder<TransaksiController>(
                init: TransaksiController(),
                builder: (val) {
                  int b = 0;
                  val.transaksi.forEach((item) {
                    b += item['data']['bayar'];
                  });

                  return Text(uang.format(b), style: Theme.of(context).textTheme.headline4);
                },
              ),
            ],
          ),
        )
    );
  }
}
