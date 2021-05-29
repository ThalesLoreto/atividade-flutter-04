import 'package:devpizza/login_page.dart';
import 'package:flutter/material.dart';
import './menu_data.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);
  var menuData = MenuData.getData;
  //-------------------------------------------------------Menu Lateral-------------------------------

  Widget _drawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu Principal'),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Perfil'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => perfil(context)));
            },
          ),
          ListTile(
            leading: Icon(Icons.backpack),
            title: Text('Pedidos'),
            onTap: () {
              Scaffold();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pedidos(context)));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }

//-------------------------------------------------------Corpo do Principal-------------------------------
  Widget _body(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: menuData.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                height: 260,
                width: double.maxFinite,
                child: Card(
                  elevation: 25,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 3.5,
                          color: Colors.purple.shade900,
                        ),
                        color: Colors.purple.shade100),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    children: <Widget>[
                                      cardTop(menuData[index]),
                                      cardBottom(menuData[index]),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
//-------------------------------------------------------Botão flutuante-------------------------------

  Widget _shoopingCart(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => cartItens(context)));
      },
      child: Icon(
        Icons.shopping_bag,
      ),
      backgroundColor: Colors.purple,
    );
  }
//-------------------------------------------------------Parte centar do código-------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
      ),
      //--------------------------Primeiro Card
      body: Stack(
        children: [
          _shoopingCart(context),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.purple.withOpacity(0.3),
          ),
          _body(context),
        ],
      ),
      floatingActionButton: _shoopingCart(context),
      drawer: _drawer(context),
    );
  }
}
//-------------------------------------------------------Parte Superior do card-------------------------------

Widget cardTop(data) {
  return (Align(
    alignment: Alignment.topCenter,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              '${data['img']}',
              height: 100,
            ),
          ),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: '${data['name']}\n',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '${data['value']}',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    ),
  ));
}
//-------------------------------------------------------Parte Inferior do card-------------------------------

Widget cardBottom(data) {
  return (Align(
    alignment: Alignment.bottomLeft,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 25.0),
              child: Row(
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: '${data['ingredients']}',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.purple)),
                        child: Text('Add'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
//-------------------------------------------------------Tela de Perfil-------------------------------

Widget perfil(context) {
  return (Scaffold(
    appBar: AppBar(
      title: Text("Perfil"),
      backgroundColor: Colors.purple,
    ),
    body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        )
      ],
    ),
  ));
}
//-------------------------------------------------------Tela de Pedidos-------------------------------

Widget pedidos(context) {
  return (Scaffold(
    appBar: AppBar(
      title: Text("Pedidos"),
      backgroundColor: Colors.purple,
    ),
    body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        )
      ],
    ),
  ));
}

//-------------------------------------------------------Tela de Itens Selecionados-------------------------------
Widget cartItens(BuildContext context) {
  String payment;
  bool checked;
  return (Scaffold(
    appBar: AppBar(
      title: Text("Itens selecionados"),
      backgroundColor: Colors.purple,
    ),
    body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 12),
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Os Seus Pedidos são',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 30))),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Pizza de calabresa x2',
                          style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(thickness: 2),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                              text: 'Total do Pedido:',
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(width: 100),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RichText(
                            text: TextSpan(
                              text: 'R\$45.90',
                              style: TextStyle(
                                  color: Colors.purpleAccent, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 12),
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Formas de pagamento',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 30))),
                    SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //     alignment: Alignment.center,
                    //     child: CheckboxListTile(
                    //       title: Text('lala'),
                    //       secondary: Icon(Icons.card_giftcard),
                    //       controlAffinity: ListTileControlAffinity.platform,
                    //       value: checked,
                    //       onChanged: (bool value) {
                    //         setState(() {
                    //           checked = value;
                    //         });
                    //       },
                    //       activeColor: Colors.white,
                    //       checkColor: Colors.purple,
                    //     )),
                    Divider(thickness: 2),
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    ),
  ));
}
