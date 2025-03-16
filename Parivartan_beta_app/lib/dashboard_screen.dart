  import 'package:flutter/material.dart';
  import 'package:table_calendar/table_calendar.dart';
  import 'package:untitled3/profile_screen.dart'; // Import the table_calendar package

  void main() {
    runApp(StudentApp());
  }

  class StudentApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parivartan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      );
    }
  }

  class MainScreen extends StatefulWidget {
    @override
    _MainScreenState createState() => _MainScreenState();
  }

  class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: AppDrawer(),
        body: _selectedIndex == 0
            ? Dashboard()
            : _selectedIndex == 1
            ? CalendarScreen()
            : _selectedIndex == 2
            ? ToDoScreen()
            : _selectedIndex == 3
            ? NotificationScreen()
            : ChatbotScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: 'To Do',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'AI Chatbot',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.black,
        ),
      );
    }
  }

  class AppDrawer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Aman Panchal'),
              accountEmail: Text('aman@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  'ID',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                  // Navigate to the ProfileScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horiz),
              title: Text('Change User'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Files'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      );
    }
  }

  class Dashboard extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              CourseCard(subject: 'Science', progress: 100, imageUrl: 'assets/images/icon.jpg'),
              CourseCard(subject: 'Social Studies', progress: 75, imageUrl: 'assets/images/icon.jpg'),
              CourseCard(subject: 'Hindi', progress: 50, imageUrl: 'assets/images/icon.jpg'),
              CourseCard(subject: 'Chemistry', progress: 30, imageUrl: 'assets/images/icon.jpg'),
              CourseCard(subject: 'Biology', progress: 90, imageUrl: 'assets/images/icon.jpg'),
              CourseCard(subject: 'Mathematics', progress: 60, imageUrl: 'assets/images/icon.jpg'),
            ],
          ),
        ),
      );
    }
  }

  class CourseCard extends StatelessWidget {
    final String subject;
    final int progress;
    final String imageUrl;

    const CourseCard({
      Key? key,
      required this.subject,
      required this.progress,
      required this.imageUrl,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Card(
        elevation: 4,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: 20.0,
                  width: 40.0,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      '$progress%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  subject,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  class ToDoScreen extends StatefulWidget {
    @override
    _ToDoScreenState createState() => _ToDoScreenState();
  }

  class _ToDoScreenState extends State<ToDoScreen> {
    List<Task> tasks = [];
    final TextEditingController _controller = TextEditingController();

    void _addTask() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          tasks.add(Task(title: _controller.text));
          _controller.clear();
        });
      }
    }

    void _deleteTask(int index) {
      setState(() {
        tasks.removeAt(index);
      });
    }

    void _toggleCompletion(int index) {
      setState(() {
        tasks[index].isCompleted = !tasks[index].isCompleted;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter a task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tasks[index].title,
                      style: TextStyle(
                        decoration: tasks[index].isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: tasks[index].isCompleted,
                      onChanged: (bool? value) {
                        _toggleCompletion(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  class Task {
    String title;
    bool isCompleted;

    Task({required this.title, this.isCompleted = false});
  }

  class CalendarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: DateTime.now(),
          onDaySelected: (selectedDay, focusedDay) {
            print('Selected day: $selectedDay');
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
  }

  class NotificationScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Assignment due tomorrow'),
            subtitle: Text('Math homework due by 5 PM'),
            trailing: Icon(Icons.notifications_active),
          ),
          ListTile(
            title: Text('Parent meeting reminder'),
            subtitle: Text('Parent meeting on Friday at 4 PM'),
            trailing: Icon(Icons.notifications_active),
          ),
        ],
      );
    }
  }

  class ChatbotScreen extends StatefulWidget {
    @override
    _ChatbotScreenState createState() => _ChatbotScreenState();
  }

  class _ChatbotScreenState extends State<ChatbotScreen> {
    TextEditingController _controller = TextEditingController();
    List<String> _messages = [];

    void _sendMessage() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          _messages.add('You: ${_controller.text}');
          _messages.add('Bot: This is a placeholder response.');
          _controller.clear();
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Ask something...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
