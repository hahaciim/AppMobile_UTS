import 'package:flutter/material.dart';
import 'account_page.dart';
import 'add_event_screen.dart';
import 'home_page.dart';
import 'finance_page.dart';
import 'styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2; // Default to 'Home' tab
  List<Map<String, dynamic>> events = []; // List to hold saved events

  // Define the list of pages and titles for each tab
  final List<Widget> _pages = [];
  final List<String> _titles = ['Account', 'Event', 'Home', 'Finance'];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const AccountPage(),
      EventList(events: events),
      const HomePage(),
      const FinancePage(),
    ]);
  }

  // Method to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Navigate to AddEventScreen and add the event to the list
  Future<void> _addNewEvent() async {
    final newEvent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEventScreen()),
    );

    if (newEvent != null) {
      setState(() {
        events.add(newEvent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex], // Display title based on selected tab
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.darkBlue, // Custom primary color for AppBar
      ),
      body: _pages[_selectedIndex], // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200], // Set navigation bar background color to light gray
        selectedItemColor: AppColors.accentBlue, // Color for selected icons and text
        unselectedItemColor: AppColors.darkGrey, // Color for unselected icons and text
        showUnselectedLabels: true, // Show labels for unselected items
        elevation: 0, // Remove shadow to avoid any overlay effect
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Finance',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
        onPressed: _addNewEvent,
        child: const Icon(Icons.add),
        backgroundColor: AppColors.darkBlue,
      )
          : null, // Show FAB only on the Event tab
    );
  }
}

// Widget to display the list of events in the Event tab
class EventList extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return events.isEmpty
        ? const Center(child: Text('No events added yet.'))
        : ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          title: Text(event['name']),
          subtitle: Text('${event['date']} at ${event['time'].format(context)}'),
          trailing: Text(event['eventType']),
        );
      },
    );
  }
}
