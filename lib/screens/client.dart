import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({ Key? key }) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Giriş Ekranim")),
    );
  }
}