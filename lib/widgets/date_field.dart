import 'package:material_ui/material_ui.dart';

/// Kolom tanggal read-only yang membuka date picker saat disentuh.
/// Dipakai ulang di formulir Education dan Experience.
class DateField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<DateTime> onPicked;
  final FormFieldValidator<String>? validator;
  final DateTime? initialDate;
  final bool enabled;

  const DateField({
    super.key,
    required this.label,
    required this.controller,
    required this.onPicked,
    this.validator,
    this.initialDate,
    this.enabled = true,
  });

  /// Mengubah DateTime menjadi teks dd/MM/yyyy.
  static String format(DateTime d) {
    final day = d.day.toString().padLeft(2, '0');
    final month = d.month.toString().padLeft(2, '0');
    return '$day/$month/${d.year}';
  }

  Future<void> _pick(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked == null || !context.mounted) return;
    controller.text = format(picked);
    onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        enabled: enabled,
        onTap: () => _pick(context),
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: "Pilih tanggal",
          suffixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
