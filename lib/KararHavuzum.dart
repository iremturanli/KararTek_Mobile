import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CustomDivider.dart';
import 'package:flutter_application_1/widgets/ModalBottomOnay.dart';
import 'package:flutter_application_1/widgets/listw.dart';
import 'package:flutter_application_1/widgets/onayBekleyenKararlarlarList.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'kararHavuzumDetay.dart';

final List<Map<String, dynamic>> _kararhavuzum = [
  {
    "id": "1",
    "esasNo": "427568912",
    "kararNo": "221/2022",
    "Kurul Adı": "1.Ceza Dairesi",
    "Mahkeme": "Bölge Adliye Mahkemesi 18. Hukuk Dairesi",
    "Hüküm":
        "Taraflar arasındaki davanın yapılan muhakemesi sonunda bölge adliye mahkemesi hukuk dairesince verilen, yukarıda tarihi ve numarası gösterilen hüküm davacı erkek tarafından, manevî tazminat talebinin reddi, maddî tazminatın miktarı ve kadın yararına tedbir nafakasına hükmolunması yönünden temyiz edilmekle, evrak okunup gereği görüşülüp düşünüldü:Dosyadaki yazılara, kararın dayandığı delillerle kanuna uygun sebeplere ve özellikle delillerin takdirinde bir yanlışlık görülmemesine göre, yerinde bulunmayan temyiz itirazlarının reddiyle usul ve kanuna uygun olan hükmün ONANMASINA, aşağıda yazılı onama harcının temyiz edene yükletilmesine, peşin alınan harcın mahsubuna ve 292.10 TL. temyiz başvuru harcı peşin alındığından başkaca harç alınmasına yer olmadığına, dosyanın ilk derece mahkemesine, karardan bir örneğinin ilgili bölge adliye mahkemesi hukuk dairesine gönderilmesine kesin olarak oy birliğiyle karar verildi. ",
    "Karar":
        "Taraflar arasındaki davanın yapılan muhakemesi sonunda bölge adliye mahkemesi hukuk dairesince verilen, yukarıda tarihi ve numarası gösterilen hüküm davacı erkek tarafından, manevî tazminat talebinin reddi, maddî tazminatın miktarı ve kadın yararına tedbir nafakasına hükmolunması yönünden temyiz edilmekle, evrak okunup gereği görüşülüp düşünüldü:Dosyadaki yazılara, kararın dayandığı delillerle kanuna uygun sebeplere ve özellikle delillerin takdirinde bir yanlışlık görülmemesine göre, yerinde bulunmayan temyiz itirazlarının reddiyle usul ve kanuna uygun olan hükmün ONANMASINA, aşağıda yazılı onama harcının temyiz edene yükletilmesine, peşin alınan harcın mahsubuna ve 292.10 TL. temyiz başvuru harcı peşin alındığından başkaca harç alınmasına yer olmadığına, dosyanın ilk derece mahkemesine, karardan bir örneğinin ilgili bölge adliye mahkemesi hukuk dairesine gönderilmesine kesin olarak oy birliğiyle karar verildi. ",
    "Karar Tarihi": "2022-10-20 11:13:21.341844+00",
    "Kayıt Tarihi": "2022-11-01 11:13:21.341844+00",
  },
  {
    "id": "2",
    "esasNo": "427568123",
    "kararNo": "221/2021",
    "Kurul Adı": "1.Ceza Dairesi",
    "Mahkeme": "Ankara Bölge Adliye Mahkemesi",
    "Hüküm":
        "5271 sayılı CMK'nın 288. ve 294. maddelerinde yer alan düzenlemeler ile 289. maddesinde sayılan kesin hukuka aykırılık halleri dikkate alınarak sanık müdafiinin dilekçesindeki temyiz sebeplerinin hükmün hukuki yönüne ilişkin olduğu belirlenerek anılan sebeplere bağlı olarak yapılan incelemede,Yargılama sürecindeki işlemlerin kanuna uygun olarak yapıldığı, aşamalarda ileri sürülen iddia ve savunmaların toplanan tüm delillerle birlikte gerekçeli kararda gösterilip tartışıldığı, eylemin sanık tarafından gerçekleştirildiğinin saptandığı, vicdanî kanının dosya içindeki belge ve bilgilerle uyumlu olarak kesin verilere dayandırıldığı, eyleme uyan suç tipi ile yaptırımların aşağıda belirtilen dışında doğru biçimde belirlendiği anlaşıldığından, yerinde görülmeyen diğer temyiz itirazlarının reddine, ancak;Yargıtay Ceza Genel Kurulunun 21/04/2015 tarih ve 2014/10-623 esas, 2015/117 sayılı kararında yabancı uyruklu olup, yakalandığında üzerinde herhangi bir kimlik belgesi çıkmayan sanığın nüfus ve adli sicil kayıtları ile ilgili hiçbir araştırma yapılmadan sadece beyan edilen kimlik bilgilerine dayanılarak hüküm kurulması usul ve kanuna aykırıdır, denilmiştir.6458 sayılı Yabancılar ve Uluslararası Koruma Kanununun 91. maddesinde geçici koruma Ülkesinden ayrılmaya zorlanmış, ayrıldığı ülkeye geri dönemeyen, acil ve geçici koruma bulmak amacıyla kitlesel olarak sınırlarımıza gelen veya sınırlarımızı geçen yabancılara geçici koruma sağlanabilir. şeklinde hüküm altına alınmış, bu kişilerin Türkiye'ye kabulü, Türkiye'de kalışı, hak ve yükümlülüklerinin Bakanlar Kurulu tarafından çıkarılacak yönetmelikle düzenleneceği belirtilmiştir. 6458 sayılı Kanun'un 91. Maddesi uyarınca çıkartılan Geçici Koruma Yönetmeliğinin (Bakanlar Kurulu Kararının Tarihi",
    "Karar":
        "6458 Yayımlandığı Resmi Gazete'nin Tarihi: 22/10/2014 No: 29153) 21. maddesinde; bu Yönetmelik kapsamındaki yabancıların kayıtları sırasında kimliğine ilişkin belge sunamayan yabancının, aksi ispat edilinceye kadar beyanının esas alınacağı, fotoğraf, parmak izi ya da kimlik tespitine elverişli diğer biometrik verilerin esas alınıp merkezi veri tabanına kaydedileceği, mevcut biometrik verilerle eşleştirileceği, kayıt altına alınan yabancıların bilgilerinin derhal Göç İdaresi Genel Müdürlüğüne bildirileceği, yabancıların kayıt bilgilerinin doğum, ölüm, evlilik, boşanma, gönüllü geri dönüş gibi hallerde güncelleneceği, adres kayıt sistemine kaydedilecekleri düzenlemeleri getirilmiş, 22. maddesinde ise; kayıt işlemleri tamamlananlara, valilikler tarafından geçici koruma kimlik belgesi düzenleneceği, geçici koruma kimlik belgesi verilenlere, 25/04/2006 tarihli ve 5490 sayılı Nüfus Hizmetleri Kanunu kapsamında yabancı kimlik numarası verileceği belirtilmiştir.6458 sayılı Kanun'un 121. maddesine dayanılarak çıkartılan Yabancılar ve Uluslararası Koruma Kanununun Uygulanmasına İlişkin Yönetmelik 17 Mart 2016 tarih ve 29656 sayılı Resmi Gazete'de yayımlanarak yürürlüğe girmiştir. Somut olayımızda ise; sanığın kendi beyanlarına göre Afganistan vatandaşı olduğunun ve kimlik bilgilerinin tespit edildiğinin anlaşılması karşısında; yabancı uyruklu sanığa ait nüfus ve adli sicil kayıtlarının, sanığın vatandaşı olduğu ülke ve gerektiğinde uluslararası kurum ve kuruluşlardan genelgeler doğrultusunda temin edilmesi gerektiği; eğer sanığın resmi kimlik bilgilerinin diplomatik yazışmalarla belirlenemediği takdirde soruşturma makamınca sanığın beyanı üzerine tespit edilen kimlik bilgileri, dosya içerisindeki parmak izi ve fotoğraf kayıt formu ile sanığın temin edilen fotoğraflarının Göç İdaresi Genel Müdürlüğüne gönderilerek Geçici Koruma Yönetmeliğinin 21 ve 22. maddeleri uyarınca sanığın Türkiye'ye kabul edilen yabancılardan olup olmadığının ve varsa yabancı kimlik numarası ile adres kayıt sistemindeki kayıtlarının tespit edilmesi, şayet kimlikleri bu şekilde belirlenmiyorsa 6458 sayılı Kanun'un 91. maddesi uyarınca çıkartılan Geçici Koruma Yönetmeliğinin 21. ve 22. maddeleri gereğince gerekli kayıtlarının yapılıp geçici koruma belgesi çıkarılıp gönderilmesi istenilerek belirlenen kimliği esas alınıp hükümlülüğüne karar verilmesi gerektiğinin gözetilmemesi,Kanuna aykırı, sanık müdafiinin temyiz itirazları bu nedenle yerinde olup, Kayseri Bölge Adliye Mahkemesi 3. Ceza Dairesinin, 18/10/2019 tarih 2019/33 esas ve 2019/22 sayılı kararı hukuka aykırı bulunduğundan, 5271 sayılı CMK'nın 302/2. maddesi uyarınca BOZULMASINA,28/02/2019 tarihli Resmi Gazete'de yayımlanarak yürürlüğe giren 7165 sayılı Kanun'un 8. maddesi ile değişik 5271 sayılı CMK'nın 304/1. maddesi uyarınca dosyanın... Ağır Ceza Mahkemesine; kararın bir örneğinin... Bölge Adliye Mahkemesi ... Ceza Dairesine gönderilmesine, 27/12/2021 tarihinde oy birliği ile karar verildi.",
    "Karar Tarihi": "2022-10-20 11:13:21.341844+00",
    "Kayıt Tarihi": "2022-11-01 11:13:21.341844+00",
  },
  {
    "id": "3",
    "esasNo": "421234377",
    "kararNo": "211/2022",
    "Kurul Adı": "1.Ceza Dairesi",
    "Mahkeme": "Ankara Bölge Adliye Mahkemesi",
    "Hüküm":
        "Taraflar arasındaki davanın yapılan muhakemesi sonunda bölge adliye mahkemesi hukuk dairesince verilen, yukarıda tarihi ve numarası gösterilen hüküm davacı kadın tarafından yoksulluk nafakası yönünden temyiz edilmekle, evrak okunup gereği görüşülüp düşünüldü:Dosyadaki yazılara, kararın dayandığı delillerle kanuna uygun sebeplere ve özellikle delillerin takdirinde bir yanlışlık görülmemesine göre, yerinde bulunmayan temyiz itirazlarının reddiyle usul ve kanuna uygun olan hükmün ONANMASINA, aşağıda yazılı onama harcının temyiz edene yükletilmesine, peşin alınan harcın mahsubuna ve 292.10 TL. temyiz başvuru harcı peşin alındığından başkaca harç alınmasına yer olmadığına, dosyanın ilk derece mahkemesine, karardan bir örneğinin ilgili bölge adliye mahkemesi hukuk dairesine gönderilmesine kesin olarak oy birliğiyle karar verildi. 23.12.2021 (Prş.)",
    "Karar":
        "Taraflar arasındaki davanın yapılan muhakemesi sonunda bölge adliye mahkemesi hukuk dairesince verilen, yukarıda tarihi ve numarası gösterilen hüküm davacı kadın tarafından yoksulluk nafakası yönünden temyiz edilmekle, evrak okunup gereği görüşülüp düşünüldü:Dosyadaki yazılara, kararın dayandığı delillerle kanuna uygun sebeplere ve özellikle delillerin takdirinde bir yanlışlık görülmemesine göre, yerinde bulunmayan temyiz itirazlarının reddiyle usul ve kanuna uygun olan hükmün ONANMASINA, aşağıda yazılı onama harcının temyiz edene yükletilmesine, peşin alınan harcın mahsubuna ve 292.10 TL. temyiz başvuru harcı peşin alındığından başkaca harç alınmasına yer olmadığına, dosyanın ilk derece mahkemesine, karardan bir örneğinin ilgili bölge adliye mahkemesi hukuk dairesine gönderilmesine kesin olarak oy birliğiyle karar verildi. 23.12.2021 (Prş.)",
    "Karar Tarihi": "2022-10-20 11:13:21.341844+00",
    "Kayıt Tarihi": "2022-11-01 11:13:21.341844+00",
  },
  {
    "id": "4",
    "esasNo": "427568349",
    "kararNo": "271/2022",
    "Kurul Adı": "1.Ceza Dairesi",
    "Mahkeme": "Ankara Bölge Adliye Mahkemesi",
    "Hüküm":
        "Boşanma ilamı ekinde verilen yoksulluk nafakası, maddi ve manevi tazminatın icra takibine konu edilebilmesi için HUMK'nun 443. maddesi gereğince (boşanma) ilamının kesinleşmesine bağlıdır. Somut olayda takibe konu Sincan 1. Aile Mahkemesinin 20.9.2005 tarih ve 2005/276-642 sayılı tarafların boşanmasına ilişkin verdiği karar kesinleşmemiştir. Bu durumda takibe dayanak ilamda hükmolunan yukarıda belirtilen alacaklar ile yargılama gideri ve ücreti vekalet takip konusu yapılamaz. Mahkemece şikayetin kabulüne karar vermek gerekirken reddine karar vermesi isabetsizdir.SONUÇ  : Borçlu vekilinin temyiz itirazlarının kabulü ile mahkeme kararının yukarıda yazılı nedenlerle İ.İ.K. 366 ve H.U.M.K.’nun 428. maddeleri uyarınca (BOZULMASINA), 21.9.06006 gününde oybirliğiyle karar verildi.",
    "Karar":
        "Boşanma ilamı ekinde verilen yoksulluk nafakası, maddi ve manevi tazminatın icra takibine konu edilebilmesi için HUMK'nun 443. maddesi gereğince (boşanma) ilamının kesinleşmesine bağlıdır. Somut olayda takibe konu Sincan 1. Aile Mahkemesinin 20.9.2005 tarih ve 2005/276-642 sayılı tarafların boşanmasına ilişkin verdiği karar kesinleşmemiştir. Bu durumda takibe dayanak ilamda hükmolunan yukarıda belirtilen alacaklar ile yargılama gideri ve ücreti vekalet takip konusu yapılamaz. Mahkemece şikayetin kabulüne karar vermek gerekirken reddine karar vermesi isabetsizdir.SONUÇ  : Borçlu vekilinin temyiz itirazlarının kabulü ile mahkeme kararının yukarıda yazılı nedenlerle İ.İ.K. 366 ve H.U.M.K.’nun 428. maddeleri uyarınca (BOZULMASINA), 21.9.06006 gününde oybirliğiyle karar verildi. ",
    "Karar Tarihi": "2022-10-20 11:13:21.341844+00",
    "Kayıt Tarihi": "2022-11-01 11:13:21.341844+00",
  },
];

class KararHavuzum extends StatefulWidget {
  const KararHavuzum({Key? key}) : super(key: key);

  @override
  State<KararHavuzum> createState() => _KararHavuzumState();
}

class _KararHavuzumState extends State<KararHavuzum> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Karar Havuzum',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.visible),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.height / 2.5,
            child: TextField(
              decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: "Ara",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 252, 252, 252),
                  focusedBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.grey),
            ),
          ),
          Container(
            height: height / 2,
            width: width,
            child: ListView.builder(
                itemCount: _kararhavuzum.length,
                itemBuilder: ((context, index) => Card(
                      color: Color.fromARGB(255, 247, 246, 246),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 16,
                            backgroundColor: Color.fromARGB(255, 1, 28, 63),
                            child: Text(
                              _kararhavuzum[index]["id"].toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                        title: Text(
                          "${_kararhavuzum[index]["Kurul Adı"]}-${_kararhavuzum[index]["kararNo"]}",
                        ),
                        subtitle: Text(
                          '${_kararhavuzum[index]["Karar"]}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KararHavuzumDetay(
                                        List_: _kararhavuzum,
                                        ListIndex: index,
                                      )));
                        }),
                      ),
                    ))),
          ),
        ],
      )),
    );
  }
}
