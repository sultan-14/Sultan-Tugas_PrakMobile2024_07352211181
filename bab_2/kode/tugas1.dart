import 'dart:async';

enum KategoriProduk { ManajemenData, OtomatisasiJaringan }

enum PeranKaryawan { Pengembang, InsinyurJaringan, Manajer }

enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

mixin Kinerja {
  int _produktivitas = 0;
  DateTime _terakhirDiperbarui = DateTime.now();

  int get produktivitas => _produktivitas;

  void perbaruiProduktivitas(int nilaiBaru) {
    final sekarang = DateTime.now();
    final hariSejakTerakhirDiperbarui =
        sekarang.difference(_terakhirDiperbarui).inDays;

    if (hariSejakTerakhirDiperbarui < 30) {
      print("Produktivitas hanya bisa diperbarui setiap 30 hari.");
      return;
    }

    if (nilaiBaru < 0 || nilaiBaru > 100) {
      print("Nilai produktivitas harus di antara 0 dan 100.");
      return;
    }

    _produktivitas = nilaiBaru;
    _terakhirDiperbarui = sekarang;
  }
}

class Produk {
  final String nama;
  final KategoriProduk kategori;
  double harga;
  int jumlahTerjual = 0;

  Produk({
    required this.nama,
    required this.kategori,
    required double harga,
  }) : harga = harga >= 200000 ? harga : 0 {
    if (kategori == KategoriProduk.OtomatisasiJaringan && harga < 200000) {
      throw Exception(
          "Harga produk OtomatisasiJaringan harus minimal 200.000.");
    } else if (kategori == KategoriProduk.ManajemenData && harga >= 200000) {
      throw Exception("Harga produk ManajemenData harus di bawah 200.000.");
    }
  }

  void tambahPenjualan(int jumlah) {
    jumlahTerjual += jumlah;
    if (kategori == KategoriProduk.OtomatisasiJaringan && jumlahTerjual > 50) {
      final hargaDiskon = harga * 0.85;
      if (hargaDiskon >= 200000) {
        harga = hargaDiskon;
        print("Diskon 15% diterapkan, harga sekarang: Rp${harga}");
      }
    }
  }
}

class Karyawan with Kinerja {
  final String nama;
  final int umur;
  final PeranKaryawan peran;

  Karyawan({
    required this.nama,
    required this.umur,
    required this.peran,
  }) {
    if (peran == PeranKaryawan.Manajer && produktivitas < 85) {
      print("Manajer harus memiliki produktivitas minimal 85.");
    }
  }
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap({
    required String nama,
    required int umur,
    required PeranKaryawan peran,
  }) : super(nama: nama, umur: umur, peran: peran);
}

class KaryawanKontrak extends Karyawan {
  final int durasiProyek; // durasi proyek dalam hari

  KaryawanKontrak({
    required String nama,
    required int umur,
    required PeranKaryawan peran,
    required this.durasiProyek,
  }) : super(nama: nama, umur: umur, peran: peran);
}

class Proyek {
  FaseProyek fase = FaseProyek.Perencanaan;
  List<Karyawan> timProyek = [];
  DateTime? tanggalMulai;

  void tambahKaryawan(Karyawan karyawan) {
    if (timProyek.length < 20) {
      timProyek.add(karyawan);
      print("Karyawan ${karyawan.nama} ditambahkan ke tim proyek.");
    } else {
      print("Batas maksimum 20 karyawan aktif tercapai.");
    }
  }

  void pindahKePengembangan() {
    if (fase == FaseProyek.Perencanaan && timProyek.length >= 5) {
      fase = FaseProyek.Pengembangan;
      tanggalMulai = DateTime.now();
      print("Fase proyek beralih ke Pengembangan.");
    } else {
      print("Syarat untuk beralih ke Pengembangan belum terpenuhi.");
    }
  }

  void pindahKeEvaluasi() {
    if (fase == FaseProyek.Pengembangan && tanggalMulai != null) {
      final hariDalamProgres = DateTime.now().difference(tanggalMulai!).inDays;
      if (hariDalamProgres > 45) {
        fase = FaseProyek.Evaluasi;
        print("Fase proyek beralih ke Evaluasi.");
      } else {
        print(
            "Proyek harus berjalan lebih dari 45 hari untuk beralih ke Evaluasi.");
      }
    }
  }
}

class PerusahaanIT {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < 20) {
      karyawanAktif.add(karyawan);
      print("Karyawan ${karyawan.nama} ditambahkan sebagai karyawan aktif.");
    } else {
      print("Batas maksimum karyawan aktif (20) telah tercapai.");
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    if (karyawanAktif.remove(karyawan)) {
      karyawanNonAktif.add(karyawan);
      print(
          "Karyawan ${karyawan.nama} telah resign dan kini menjadi non-aktif.");
    } else {
      print("Karyawan tidak ditemukan dalam daftar aktif.");
    }
  }
}

void main() {
  // Contoh produk
  try {
    var produk1 = Produk(
        nama: "Data Analyzer",
        kategori: KategoriProduk.ManajemenData,
        harga: 150000);
    var produk2 = Produk(
        nama: "Network Optimizer",
        kategori: KategoriProduk.OtomatisasiJaringan,
        harga: 250000);

    produk2.tambahPenjualan(51); // Menambah penjualan untuk mendapatkan diskon
  } catch (e) {
    print(e);
  }

  // Contoh karyawan
  var karyawanTetap =
      KaryawanTetap(nama: "Alice", umur: 30, peran: PeranKaryawan.Manajer);
  var karyawanKontrak = KaryawanKontrak(
      nama: "Bob", umur: 25, peran: PeranKaryawan.Pengembang, durasiProyek: 60);

  // Update produktivitas karyawan
  karyawanTetap.perbaruiProduktivitas(90);
  karyawanKontrak.perbaruiProduktivitas(70);

  // Proyek
  var proyek = Proyek();
  proyek.tambahKaryawan(karyawanTetap);
  proyek.tambahKaryawan(karyawanKontrak);

  // Pindah ke fase berikutnya
  proyek.pindahKePengembangan();
  proyek.pindahKeEvaluasi(); // Harus menunggu 45 hari untuk pindah ke Evaluasi

  // Manajemen karyawan
  var perusahaan = PerusahaanIT();
  perusahaan.tambahKaryawan(karyawanTetap);
  perusahaan.tambahKaryawan(karyawanKontrak);

  // Karyawan resign
  perusahaan.resignKaryawan(karyawanKontrak);
}
