
// Gerekli Flutter ve kendi oluşturduğum modülleri içe aktarıyorum
import 'package:flutter/material.dart';
import 'package:flutter_application_2/burc_item.dart';
import 'package:flutter_application_2/data/strings.dart';
import 'package:flutter_application_2/model/burc.dart';


/* MyApp adında StatefulWidget tanımlıyorum, StatefulW değişim
olmayan ya da olmayacak yerlerde tercih edilir. */
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}


/* MyAppState adında bir sınıf oluşturuyorum ve burada arama 
işlevselliği barındıran bir widget yapıyorum.
Bu kısım, arama çubuğu içeren ve kullanıcı herhangi bir
şey yazdığında arama metnini güncelleyen bir widget'i oluşturuyor. */
class _MyAppState extends State<MyApp> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BURÇLARIN LİSTESİ')),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  }
                  );
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BurcListesi(searchText: searchText),),
          ],
        ),
      ),
    );
  }
}


/* Bu kısım, BurcListesi adlı bir widget'i oluşturuyor.
Bu widget, veri kaynağını alır, bu verileri arama metni kullanarak
filtreler ve sonuçları liste olarak görüntüler. */
class BurcListesi extends StatelessWidget {
  final String searchText;
  BurcListesi({required this.searchText});
@override
  Widget build(BuildContext context) {
    List<Burc> tumBurclar = veriKaynaginiHazirla();
    List<Burc> filtrelenmisBurclar = searchText.isEmpty
        ? tumBurclar
        : tumBurclar
            .where((burc) =>
                burc.burcAdi.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index){
            return BurcItem(listelenenBurc: filtrelenmisBurclar[index]);
          },
          itemCount: filtrelenmisBurclar.length
        ),
      ),
    );
  }
  

  List<Burc> veriKaynaginiHazirla() {
/* Burç verilerini Strings sınıfından alarak bir liste oluşturuyoruz,
bu liste burçları ve burç sınıfının nesnelerini içerecek.
Burç verileri burada hazırlanarak liste olarak döndürülecek. */
    List<Burc> gecici = [];
    for (int i=0; i<12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim = 
        Strings.BURC_ADLARI[i].toLowerCase() + '${i+1}.png';
      var burcBuyukResim =
        Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i+1}.png';
      Burc eklenecekBurc = Burc( burcAdi,
      burcTarihi,
      burcDetay,
      burcKucukResim,
      burcBuyukResim,
      ad: '');
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
