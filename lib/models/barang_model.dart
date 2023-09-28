class BarangModel {
  int? id, jumlahBarang;
  String? namaBarang;
  bool isSelected;

  BarangModel({
    required this.id,
    required this.namaBarang,
    required this.jumlahBarang,
    this.isSelected = false,
  });

  factory BarangModel.fromJson(Map<String, dynamic> object) {
    return BarangModel(
      id: object['id'],
      namaBarang: object['nama_barang'],
      jumlahBarang: object['jumlah_barang'],
    );
  }
}
