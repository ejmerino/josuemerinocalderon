import 'package:flutter/material.dart';
import '../model/verdura_model.dart';

class VerduraForm extends StatefulWidget {
  final Verdura? verdura; // Verdura para editar (null si es agregar)
  final Function(Verdura) onSave;

  VerduraForm({this.verdura, required this.onSave});

  @override
  _VerduraFormState createState() => _VerduraFormState();
}

class _VerduraFormState extends State<VerduraForm> {
  final _formKey = GlobalKey<FormState>();
  late int _codigo;
  late String _descripcion;
  late double _precio;

  @override
  void initState() {
    super.initState();
    _codigo = widget.verdura?.codigo ?? 0;
    _descripcion = widget.verdura?.descripcion ?? '';
    _precio = widget.verdura?.precio ?? 0.0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final nuevaVerdura = Verdura(
        codigo: _codigo,
        descripcion: _descripcion,
        precio: _precio,
      );
      widget.onSave(nuevaVerdura);
      Navigator.of(context).pop(); // Cierra el formulario
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.verdura == null ? "Agregar Verdura" : "Editar Verdura"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _codigo == 0 ? '' : _codigo.toString(),
                decoration: InputDecoration(labelText: "Código"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El código es obligatorio";
                  }
                  return null;
                },
                onSaved: (value) {
                  _codigo = int.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _descripcion,
                decoration: InputDecoration(labelText: "Descripción"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "La descripción es obligatoria";
                  }
                  return null;
                },
                onSaved: (value) {
                  _descripcion = value!;
                },
              ),
              TextFormField(
                initialValue: _precio == 0 ? '' : _precio.toString(),
                decoration: InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El precio es obligatorio";
                  }
                  return null;
                },
                onSaved: (value) {
                  _precio = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
