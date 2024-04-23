import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}



class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //test();
    sayacKontrol();
  }
  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0 ;
    setState(() {
      sayac = sayac +1;
    });
    sp.setInt("sayac", sayac);

  }
  Future<void> test() async{
    var sp = await SharedPreferences.getInstance(); // tanımlama

    var arkadasListe = <String>[];
    arkadasListe.add("Ali");
    arkadasListe.add("Veli");
    arkadasListe.add("Kamil");
    //veri kaydı
    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.82);
    sp.setBool("bekar", true);
    sp.setStringList("arkadasListesi", arkadasListe);


    //veri silme
    sp.remove("ad");

    //veri okuma
    String gelenAd = sp.getString("ad") ?? "isim yok"; // eger key yanlışsa varsayılan olarak  isim yok gelir
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenMedeniDurum = sp.getBool("bekar") ?? false;
    print("gelen ad          : $gelenAd");
    print("gelen yas         : $gelenYas");
    print("gelen boy         : $gelenBoy");
    print("gelen medeni durum: $gelenMedeniDurum");

    var gelenArkadasListesi = sp.getStringList("arkadasListesi") ?? null;
    if (gelenArkadasListesi != null)
      {
        for(int i = 0 ; i<gelenArkadasListesi.length ;i++ )
        {
          print("Arkadaş : ${gelenArkadasListesi[i]}");

        }

      }
    else
    {
      print("Liste boş");

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text("Shared Preferences"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Açılış Sayısı : $sayac",style: TextStyle(fontSize: 50),)

          ],


        ),
      ),
    );
  }
}
