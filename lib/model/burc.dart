
class Burc{

  final String _burcAdi;  //Burcun adı (özel erişim)
  final String _burcTarihi;  //Burcun tarihi (özel erişim)
  final String _burcDetayi;  //Burcun detayı (özel erişim)
  final String _burcKucukResim;  //Küçük resim yolu (özel erişim)
  final String _burcBuyukResim;  //Büyük resim yolu (özel erişim)


// Get metodları ile özelliklere erişim
  get burcAdi => this._burcAdi;

  get burcTarihi => this._burcTarihi;

  get burcDetayi => this._burcDetayi;

  get burcKucukResim => this._burcKucukResim;

  get burcBuyukResim => this._burcBuyukResim;


// Kurucu metot (Constructor)
  Burc(
  this._burcAdi,
  this._burcTarihi,
  this._burcDetayi,
  this._burcKucukResim,
  this._burcBuyukResim, {required String ad});

// Constructor ile özellkler atanır

// "ad" paremetresi gereklidir ve kullanılmaktadır


  @override
  String toString() {
    return '$_burcAdi - $_burcBuyukResim';

// toString metodu, sınıf nesnesi metin olarak temsil edildiğinde kullanılır

// Bu durumda, burc adı ve büyük resim yolu birleştirilerek döndürülür
  }
}

