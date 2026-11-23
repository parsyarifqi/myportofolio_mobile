import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/date_field.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  DateTime ? _startDate;
  DateTime ? _endDate;
  bool _isCurrent = false;
  

  String _experienceName = "";
  String _description = "";
  String _category = "Part-time";

  final List<String> _categories = [
    'Internship',
    'Research',
    'Part-time',
    'Full-time',
    'Freelance',
    'Academics'
  ];

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Experience Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      drawer: const LeftDrawer(),
      
      body: Material(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === Project Name ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Pengalaman",
                      labelText: "Nama Pengalaman",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _experienceName = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Nama pengalaman tidak boleh kosong!";
                      }

                      if (value.trim().length > 100) {
                        return "Nama pengalaman maksimal 100 karakter";
                      }
                      return null;
                    },
                  ),
                ),

                // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Deskripsi Pengalaman",
                      labelText: "Deskripsi Pengalaman",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Deskripsi pengalaman tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Kategori Pengalaman",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    initialValue: _category,
                    items: _categories
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                  ),
                ),

                // === Start date ===
                DateField(
                  label: "Waktu dimulai",
                  controller: _startDateController,
                  initialDate: _startDate,
                  onPicked: (d) => setState(() => _startDate = d),
                  validator: (_) => _startDate == null ? "Waktu mulai wajib diisi!" : null,
                ),

                SwitchListTile(
                  title: const Text('Masih berlangsung'),
                  value: _isCurrent,
                  onChanged: (v) => setState(() {
                    _isCurrent = v;
                    if (v) {
                      _endDate = null;
                      _endDateController.clear();
                    }
                  }),
                ),
                // === End date ===
                DateField(
                  label: "Waktu berakhir",
                  controller: _endDateController,
                  initialDate: _endDate,
                  enabled: !_isCurrent,
                  onPicked: (d) => setState(() => _endDate = d),
                  validator: (_) {
                    if (_isCurrent) return null;
                    if (_endDate == null) {
                      return "Ended At wajib dipilih, atau aktifkan 'Masih berlangsung'!";
                    }
                    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
                      return "Waktu berakhir tidak boleh lebih awal dari waktu mulai";
                    }
                    return null;
                  },
                ),
    
                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Pengalaman berhasil ditambahkan!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Nama Pengalaman: $_experienceName'),
                                      Text('Deskripsi: $_description'),
                                      Text('Kategori: $_category'),
                                      Text('Tanggal Dimulai: ${DateField.format(_startDate!)}'),
                                      Text('Tanggal Berakhir: ${_isCurrent ? "Masih berlangsung" : DateField.format(_endDate!)}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),              
              ],
            ),
          ),
        ),
      )
    );
  }
}