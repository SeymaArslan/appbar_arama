import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // toolbar üzerinde arama işlemi yapmak için textfield kullanılabilir
  // iki tasarım oluşturulur, arama yapıldığı durum ve arama yapılmadığı durum şeklinde
  // arama yapıldığını state özelliği olan bir değişken ile takip edebiliriz

  // arama yapıp yapmadığımızı kontrol edecek bir değişken oluşturacağız
  bool aramaYap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYap ?
            TextField(  // aramaYap true ise burası
              decoration: InputDecoration(hintText: "Arama için bir şey yazın"),
              onChanged: (aramaSonucu){ // textfield içerisine girdiğimiz veya sildiğimiz her durumda arama sonucunu içerisinde ne varsa bize verecek, yani her karakter
                // değişiminde bize bir sonuç döndürecek
                print("Arama sonucu : $aramaSonucu");
              },
            )
            : Text("AppBar Arama"),  // bool değişken ile arama yapılıyor mu koşuluyla kontrol sağlayacağız ve aramaYap false ise burası çalışacak
        actions: [
          aramaYap ?
            IconButton(
              onPressed: (){
                setState(() {
                  aramaYap = false;
                });
              },
              icon: Icon(Icons.cancel), // arama yapılıyorsa cancel ikonu çıkacak arama bölümünden çıkmamızı ifade ediyor
            ) //buradaki virgul fazla ve sildik
          : IconButton(
              onPressed: (){
                setState(() {
                  aramaYap = true;
                });
              },
              icon: Icon(Icons.search), // arama yapılmıyorsa arama ikonu çıkacak
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
