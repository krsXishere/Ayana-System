import 'package:ayana_system_admin/common/theme.dart';
import 'package:ayana_system_admin/widgets/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';
import '../../models/barang_model.dart';

class GudangPage extends StatefulWidget {
  const GudangPage({super.key});

  @override
  State<GudangPage> createState() => GudangPageState();
}

class GudangPageState extends State<GudangPage> {
  List<BarangModel> dataBarang = [
    BarangModel(id: 1, namaBarang: "Jahe", jumlahBarang: 2),
    BarangModel(id: 2, namaBarang: "Kencur", jumlahBarang: 2),
    BarangModel(id: 3, namaBarang: "Merica", jumlahBarang: 2),
    BarangModel(id: 4, namaBarang: "Ketumbar", jumlahBarang: 2),
  ];
  List selectedDataBarang = [];

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        centerTitle: true,
        title: Text(
          "Gudang",
          style: primaryTextStyle.copyWith(
            color: white,
          ),
        ),
        actions: [
          CustomIconButtonWidget(
            tooltip: "Tambah Barang",
            onTap: () {},
            color: white,
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: dataBarang.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              dataBarang[index].namaBarang.toString(),
              style: primaryTextStyle,
            ),
            subtitle: Text(
              "${dataBarang[index].jumlahBarang.toString()} ton",
              style: primaryTextStyle.copyWith(fontSize: 12),
            ),
            trailing: CustomIconButtonWidget(
              tooltip: "Edit Barang",
              onTap: () {},
              color: white,
            ),
          );
        },
      ),
    );
  }
}
