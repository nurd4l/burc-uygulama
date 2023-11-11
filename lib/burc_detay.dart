
// İlgili Flutter ve diğer kütüphanelerin import edildiği kısım.
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';


/* BurcDetay adında bir StatefulWidget sınıfı oluşturuldu. Bu sınıf,
seçilen bir burcun detaylarını göstermek için kullanılacak. */
class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}


/* _BurcDetayState adında bir State sınıfı oluşturuldu.
Bu sınıf, widget'ın durumunu yönetecek. */
class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Color.fromARGB(255, 224, 115, 115);
  late PaletteGenerator _generator;


/* initState Metodu ile State sınıfının başlatıldığı
anlamına gelir. super.initState() çağrısı ile başka bir
yere ihtiyaç duyulmadan önce durum ayarları yapılabilir.
Bu durumda, appbarRenginiBul() fonksiyonu çağrılarak
appbar rengi belirlenir. */
  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }


/* build metodu widget'ın görüntüsünü oluşturur. */
  @override
  Widget build(BuildContext context) {

/* Scaffold widget'ı, genel yapının temelini oluşturur. 
CustomScrollView içinde slivers kullanılarak kaydırılabilir
bir görünüm oluşturulur. */    
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [

/* Kaydırılabilir görünümün en üstünde bulunan genişleyebilir
app bar için SliverAppBar oluşturulur. */
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,

/* FlexibleSpaceBar, genişleyebilir app bar'ın içeriği ve
davranışı burada tanımlanır. */
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            centerTitle: true,
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim, fit: BoxFit.cover,),
            ),
          ),

/* SliverToBoxAdapter, diğer içeriklerin Sliver yapısında
olmadığı durumlar için SliverToBoxAdapter ile normal bir
widget eklenir. */
          SliverToBoxAdapter(
            child: 
            
/* Burcun detayları metin şeklinde burada gösterilir. */            
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi, 
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
  

  /* Bu fonksiyon, app bar'ın rengini belirlemek için kullanılır.
  PaletteGenerator ile resimdeki renkler analiz edilir. */
  void appbarRenginiBul() async{
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
      appbarRengi = _generator.dominantColor!.color;
      setState(() {
        
      });
      print(appbarRengi);
  }
}

