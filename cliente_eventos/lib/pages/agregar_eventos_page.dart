import 'package:cliente_eventos/providers/eventos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

List<String> estado = <String>['Vigente', 'Finalizado'];

class AgregarEventosPage extends StatefulWidget {
  const AgregarEventosPage({super.key});

  @override
  State<AgregarEventosPage> createState() => _AgregarEventosPageState();
}

class _AgregarEventosPageState extends State<AgregarEventosPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();
  TextEditingController lugarCtrl = TextEditingController();
  TextEditingController estadoCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();

  String dropdownValue = estado.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregado de Evento'),
        backgroundColor: Color(0xFF037470),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              campoCodigo(),
              campoNombre(),
              campoFecha(),
              Row(
                children: [
                  Text('Estado:'),
                  Spacer(),
                  DropdownButton<String>(
                    value: dropdownValue,
                    style: TextStyle(color: Colors.deepPurple),
                    items: estado.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: ((String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                      //estadoCtrl = value as TextEditingController;
                    }),
                  )
                ],
              ),
              campoLugar(),
              campoPrecio(),
              campoStock(),
              botonAgregar()
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoCodigo() {
    return TextFormField(
      controller: codigoCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.fileCode),
        labelText: 'Codigo',
        hintText: 'Ingrese Codigo',
      ),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.person),
        labelText: 'Nombre',
        hintText: 'Ingrese Nombre',
      ),
    );
  }

  TextField campoFecha() {
    return TextField(
      controller: fechaCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.calendar),
        labelText: 'Fecha',
        hintText: 'Ingrese la Fecha',
      ),
      readOnly: true,
      keyboardType: TextInputType.number,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            String fechaFormateada =
                DateFormat("dd-MM-yyyy").format(pickedDate);
            fechaCtrl.text = fechaFormateada.toString();
          });
        } else {
          print('Fecha no Seleccionada');
        }
      },
    );
  }

  TextFormField campoLugar() {
    return TextFormField(
      controller: lugarCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.campground),
        labelText: 'Ubicacion',
        hintText: 'Ubicacion del Evento',
      ),
    );
  }

  TextFormField campoPrecio() {
    return TextFormField(
      controller: precioCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.dollarSign),
        labelText: 'Precio',
        hintText: 'Precio entrada',
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoStock() {
    return TextFormField(
      controller: stockCtrl,
      decoration: InputDecoration(
        icon: Icon(FontAwesomeIcons.sortNumericAsc),
        labelText: 'Stock',
        hintText: 'Cantidad de entradas',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonAgregar() {
    return Container(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.save),
            Text('Agregar Evento'),
          ],
        ),
        onPressed: () async {
          String cod_evento = codigoCtrl.text.trim();
          String nombre = nombreCtrl.text.trim();
          DateTime fecha = fechaCtrl as DateTime;
          String estado = 'Vigente';
          //String estado = estadoCtrl.text.trim();
          String lugar = lugarCtrl.text.trim();
          int precio = int.tryParse(precioCtrl.text.trim()) ?? 0;
          int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;

          await EventosProvider()
              .agregar(cod_evento, nombre, fecha, estado, lugar, precio, stock);
          Navigator.pop(context);
        },
      ),
    );
  }
}
