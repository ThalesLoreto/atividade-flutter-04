import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  String email;
  String password;
  String name;
  String address;
  String number;

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Steve_Pizza.png',
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 20, bottom: 12),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (text) {
                              name = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (text) {
                              address = text;
                            },
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              labelText: 'Endereço',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (text) {
                              number = text;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Número',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (text) {
                              password = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.deepPurple,
                            onPressed: () {
                              //aqui vem o código para adicionar um novo usuário
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Registrar-se',
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
    ));
  }
}
