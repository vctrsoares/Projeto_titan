import 'package:flutter/material.dart';
import '../components/bottom_navigation_bar.dart'; // Certifique-se de ter o caminho correto

class SettingsPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const SettingsPage({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String userName;
  late String userEmail;
  String passwordChanged = "alterado há pouco";

  @override
  void initState() {
    super.initState();
    userName = widget.userName;
    userEmail = widget.userEmail;
  }

  void updateUserName(String newName) {
    setState(() {
      userName = newName;
    });
  }

  void updateUserEmail(String newEmail) {
    setState(() {
      userEmail = newEmail;
    });
  }

  void updatePasswordChanged(String newInfo) {
    setState(() {
      passwordChanged = newInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Top illustration
              Center(
                child: Image.asset(
                  'assets/images/image_settings.png', // Placeholder image URL
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              // Notifications toggle
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notificações'),
                  trailing: Switch(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                  'Informação da Conta',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                  const SizedBox(height: 20),
              // Account information
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Nome'),
                      subtitle: Text(userName),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        final newName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditNamePage(name: userName)),
                        );
                        if (newName != null) {
                          updateUserName(newName);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(userEmail),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        final newEmail = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditEmailPage(email: userEmail)),
                        );
                        if (newEmail != null) {
                          updateUserEmail(newEmail);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('Senha'),
                      subtitle: Text(passwordChanged),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        final newInfo = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordPage()),
                        );
                        if (newInfo != null) {
                          updatePasswordChanged(newInfo);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (int index) {
          // Handle navigation
        },
      ),
    );
  }
}

class EditNamePage extends StatelessWidget {
  final String name;

  EditNamePage({required this.name});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: name);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditEmailPage extends StatelessWidget {
  final String email;

  EditEmailPage({required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: email);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nova Senha'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "alterado há pouco");
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
