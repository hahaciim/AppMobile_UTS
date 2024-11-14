// add_event_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'styles.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isPrivate = false;
  String _eventType = 'Meeting';

  // Show date picker with blue and white theme
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.darkBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: AppColors.darkBlue, // Date text color
            ),
            dialogBackgroundColor: Colors.white, // Background color
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Show time picker with blue and white theme
  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.darkBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: AppColors.darkBlue, // Time text color
            ),
            dialogBackgroundColor: Colors.white, // Background color
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  // Save event
  void _saveEvent() {
    if (_eventNameController.text.isEmpty || _selectedDate == null || _selectedTime == null) {
      // Validation: Ensure required fields are filled
      return;
    }

    Navigator.pop(context, {
      'name': _eventNameController.text,
      'date': DateFormat('yyyy-MM-dd').format(_selectedDate!),
      'time': _selectedTime,
      'location': _locationController.text,
      'description': _descriptionController.text,
      'isPrivate': _isPrivate,
      'eventType': _eventType,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: const Text(
          'Add New Event',
          style: TextStyle(
            color: Colors.white, // Set title text color to white
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.darkBlue, // Set background color to blue
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back arrow color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Name
              TextField(
                controller: _eventNameController,
                decoration: const InputDecoration(
                  labelText: 'Event Name',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Event Date
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Pick a date'
                      : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                  style: TextStyle(color: AppColors.darkBlue),
                ),
                trailing: const Icon(Icons.calendar_today, color: AppColors.darkBlue),
                onTap: _pickDate,
              ),
              const SizedBox(height: 16.0),

              // Event Time
              ListTile(
                title: Text(
                  _selectedTime == null
                      ? 'Pick a time'
                      : _selectedTime!.format(context),
                  style: TextStyle(color: AppColors.darkBlue),
                ),
                trailing: const Icon(Icons.access_time, color: AppColors.darkBlue),
                onTap: _pickTime,
              ),
              const SizedBox(height: 16.0),

              // Event Location
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Event Description
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Private Event Checkbox
              CheckboxListTile(
                title: const Text('Private Event', style: TextStyle(color: AppColors.darkBlue)),
                activeColor: AppColors.darkBlue,
                value: _isPrivate,
                onChanged: (bool? value) {
                  setState(() {
                    _isPrivate = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Event Type Dropdown
              DropdownButtonFormField<String>(
                value: _eventType,
                items: <String>[
                  'Meeting',
                  'Birthday',
                  'Wedding',
                  'Conference',
                  'Party',
                  'Holiday',
                  'Assignment',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: AppColors.darkBlue)), // Set text color
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _eventType = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Event Type',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.darkBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.darkBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.darkBlue),
                  ),
                ),
                dropdownColor: Colors.white, // Set dropdown background color
                iconEnabledColor: AppColors.darkBlue, // Set dropdown arrow color
              ),
              const SizedBox(height: 16.0),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _saveEvent,
                  child: const Text(
                    'Save Event',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
