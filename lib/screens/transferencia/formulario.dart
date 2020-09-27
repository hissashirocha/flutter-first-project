import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferência";
const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";
const _rotuloCampoNumeroConta = "Número da Conta";
const _dicaCampoNumeroConta = "000-0";
const _textBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_tituloAppBar)),
        body: Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Editor(
                  controlador: widget._controladorCampoNumeroConta,
                  rotulo: _rotuloCampoNumeroConta,
                  dica: _dicaCampoNumeroConta,
                ),
                Editor(
                    controlador: widget._controladorCampoValor,
                    rotulo: _rotuloCampoValor,
                    dica: _dicaCampoValor,
                    icone: Icons.monetization_on),
                RaisedButton(
                  child: Text(_textBotaoConfirmar),
                  onPressed: () => _criaTransferencia(context),
                ),
              ],
            ),
          );
        }));
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = widget._controladorCampoNumeroConta.text;
    final double valor = double.tryParse(widget._controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('$transferenciaCriada'),
      ));
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
