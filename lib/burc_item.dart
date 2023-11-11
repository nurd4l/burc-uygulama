
import 'package:flutter/material.dart';
import 'package:flutter_application_2/burc_detay.dart';
import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;

/* listelenenBurc, Burc sınıfının bir örneğini içerir.
Bu özellik, burcun adı, tarihi ve resim yolları gibi verileri taşır.
BurcItem constructor'ı, listelenenBurc adında bir Burc nesnesi alır. */

  const BurcItem({required this.listelenenBurc, Key? key }) : super (key: key);
  @override

// build metodu; kartın içeriği, başlık, altbaşlık, resim ve simge gibi öğeleri içerir.

  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;

// Mevcut tema stilini alır

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {

// Kart tıklandığında çalıştırılacak işlemi belirler.

              Navigator.of(context).push(

/* Yeni bir sayfaya geçiş yapılır.
Bu sayfa BurcDetay adındaki başka bir sınıftan oluşturulur
ve tıklanan burcun detaylarını gösterir.*/

                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc)
                ),
              );
            },
// leading, kartın sol tarafındaki küçük resmi yerleştirir.

            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
            ),

// title ve subtitle, kartın başlık ve altbaşlık bölümlerini oluşturur.

            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.subtitle1,
            ),

// trailing, kartın sağ tarafına, simge yerleştirir ve rengini belirtir.

            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(161, 178, 48, 201),
            ),
          ),
        ),
      ),
    );
  }
}
