
// Gerekli kütüphaneleri içe aktarıyorum.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'burc_listesi.dart';


/* Uygulamanın ana noktasını belirterek,
uygulama durumunu yöneten BurcProvider sınıfını oluşturuyorum.
Bu sınıf uygulama durumunu yönetmeye başlanılan yerdir. */
void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => BurcProvider(),
        child: MyApp(),
      ),
    );

/* MyApp adında StatefulWidget tanımlanıyor. */
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


/* Bir State sınıfı oluşturuyorum, burada arama işlevselliğini
barındıran bir widget oluşturuluyor.
Bu kısım, kullanıcı herhangi bir şey yazdığında arama metnini
güncelleyen bir widget tır. ChangeNotifierProvider ile uygulama
durumunu yönettiğim bir sınıf olan BurcProvider'ı
kullanarak bu durumu yönetmeye hazırlık yapmaktadır.*/
class _MyAppState extends State<MyApp> {
  String searchText =  '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(223, 104, 46, 114),
          title: const Center(child: Text('BURÇLARIN LİSTESİ')),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState (() {
                    searchText = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Burç Ara',
                  hintText: 'Aramak için yaz',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BurcListesi(searchText: searchText,),
            ),  
          ],
        ), 
      ), 
    );
  }
}


/* Bu kısım, Provider ile uygulama durumunu yönetmek için
kullanılır. Burada _searchText adlı özel bir alan (private field)
vardır ve bu alana erişim sağlayan searchText adlı bir get
fonksiyonu vardır. Aynı zamanda updateSearchText adlı bir
fonksiyon, _searchText alanını güncelleyebilmektedir ve
kullanıcılara (notifyListeners()) haber verebilir. Bu,
kullanıcının arama metnini güncellediğinde arama sonuçlarının
yeniden oluşturulmasına olanak tanır. */
class BurcProvider with ChangeNotifier {

  String _searchText = '';
  String get searchText => _searchText;

  void updateSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }
}


