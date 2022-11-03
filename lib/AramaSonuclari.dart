// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/kararArama.dart';

// ignore: must_be_immutable
class AramaSonuclari extends StatefulWidget {
  List<Map<String, dynamic>> _foundUsers;
  AramaSonuclari(this._foundUsers, {Key? key}) : super(key: key);

  @override
  State<AramaSonuclari> createState() => _AramaSonuclariState();
}

class _AramaSonuclariState extends State<AramaSonuclari> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._foundUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text('Arama Sonuçları',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: Container(
        child: widget._foundUsers.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: ListView.builder(
                  itemCount: widget._foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(widget._foundUsers[index]["id"]),
                    color: Color.fromARGB(255, 223, 228, 236),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    child: ListTile(
                      leading: Text(
                        widget._foundUsers[index]["id"].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 1, 28, 63),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      title: Text(widget._foundUsers[index]['name']),
                      subtitle: Text(
                          '${widget._foundUsers[index]["age"].toString()} years old'),
                      onTap: (() {
                        Navigator.of(context).pop(KararArama());
                      }),
                    ),
                  ),
                ),
              )
            : const Text(
                '',
                //  style: TextStyle(fontSize: 24),
              ),
        // child: Text(widget._foundUsers.toString()),
      ),
    );
  }
}
