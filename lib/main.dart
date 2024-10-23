import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Simulação de dados até a integração com o Firebase
final List<Monitor> monitors = [
  Monitor(name: 'Monitor 1', avatarUrl: 'https://via.placeholder.com/150', schedule: 'Seg-Sex: 14h - 18h'),
  Monitor(name: 'Monitor 2', avatarUrl: 'https://via.placeholder.com/150', schedule: 'Seg-Sex: 10h - 12h'),
  Monitor(name: 'Monitor 3', avatarUrl: 'https://via.placeholder.com/150', schedule: 'Ter-Qua: 16h - 20h'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitores DPD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                viewportFraction: 0.8, // Diminuir o espaço entre os cards
              ),
              items: monitors.map((monitor) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonitorDetailPage(monitor: monitor),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(monitor.avatarUrl),
                              radius: 50,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              monitor.name,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Padding( // Adicionando Padding para espaço entre a borda e a descrição
                              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Margem lateral
                              child: Text(
                                'Responsável por ajudar os alunos',
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center, // Centraliza o texto
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

class Monitor {
  final String name;
  final String avatarUrl;
  final String schedule;

  Monitor({required this.name, required this.avatarUrl, required this.schedule});
}

class MonitorDetailPage extends StatelessWidget {
  final Monitor monitor;

  const MonitorDetailPage({super.key, required this.monitor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(monitor.avatarUrl),
                  radius: 60,
                ),
                const SizedBox(height: 20),
                Text(
                  'Horários de monitoria:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Text(
                  monitor.schedule,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

// Widget de Header
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        'Cotuca - Monitores DPD 2024.',
        style: TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center, // Centraliza o texto
      ),
    );
  }
}

// Widget de Footer
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        'Júlio César Dourado - 2024. RA: 23633.',
        style: TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.center, // Centraliza o texto
      ),
    );
  }
}
