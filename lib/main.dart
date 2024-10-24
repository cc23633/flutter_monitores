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
                viewportFraction: 0.35, // Diminuir o espaço entre os cards
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Responsável por ajudar os alunos',
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(monitor.avatarUrl),
                      radius: 60,
                    ),
                    const SizedBox(width: 10), // Espaçamento entre a foto e o ícone
                    Tooltip(
                      message: 'Essa foto foi autorizada pelo monitor!', // Mensagem que aparece ao passar o mouse
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 80), // Ajusta a posição do ícone para cima
                        child: const Icon(
                          Icons.help_outline,
                          size: 24,
                          color: Colors.grey, // Mudando a cor para cinza
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Horários de monitoria:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  monitor.schedule,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Volta para a página anterior
                  },
                  child: const Text('Voltar'),
                ),
              ],
            ),
          ),
          const Spacer(), // Para empurrar o footer para baixo
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
        textAlign: TextAlign.center,
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
        textAlign: TextAlign.center,
      ),
    );
  }
}
