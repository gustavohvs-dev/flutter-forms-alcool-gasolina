import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _resultado = "Resultado";

  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        this._resultado = "Não foi possível calcular, substitua as vírgulas por pontos nos preços";
      });
    }else{
      if(precoAlcool/precoGasolina >= 0.7){
        setState(() {
          this._resultado = "Melhor abastecer com gasolina";
        });
      }else {
        setState(() {
          this._resultado = "Melhor abastecer com álcool";
        });
      }
    }

    _limparCampos();

  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina")
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Image.asset("images/logo.png")
              ),
              Padding(
                  padding: EdgeInsets.only(top: 22),
                  child: Text(
                      "Digite abaixo o preço da gasolina e do álcool para comparar qual é o mais viável no cenário atual",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                  )
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço do álcool (ex: 1.99)"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço do gasolina (ex: 5.69)"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 22),
                  child: ElevatedButton(
                      onPressed: _calcular,
                      child: Text(
                          "Calcular",
                          style: TextStyle(
                            fontSize: 20,
                          )
                      )
                  )
              ),
              Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                        _resultado,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )
                    )
                ),
              )
            ],
          )
        )
      )
    );
  }
}
