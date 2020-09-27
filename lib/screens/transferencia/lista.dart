import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
//          final Future<Transferencia> future =
//              Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return FormularioTransferencia();
//          }));
//          future.then((transferenciaRecebida) {
//            Future.delayed(Duration(seconds: 0), () {
//              _atualiza(transferenciaRecebida);
//            });
//          });

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
        backgroundColor: Colors.yellow[500],
        foregroundColor: Colors.grey[900],
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta),
      ),
    );
  }
}
