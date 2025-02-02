import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import '../view/map_screen.dart';
import '../view/transactions_screen.dart'; // Importa la nueva pantalla de transacciones

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 40);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice para cambiar entre secciones

  // Lista de pantallas para usar con IndexedStack
  final List<Widget> _pages = [
    HomeSection(),
    TransactionsScreen(), // Mueve la pantalla de transacciones a la segunda posición
    MapScreen(), // Mueve la pantalla de ubicación a la tercera posición
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo principal negro
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white), // Icono del menú hamburguesa blanco
        title: Text(
          _selectedIndex == 0
              ? 'Hola Josue'
              : _selectedIndex == 1
                  ? 'Transacciones'
                  : 'Ubicación ESPE',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jost'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor:
            Colors.black, // Fondo negro para el Drawer excepto el header
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Color(0xFF2A2E33),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors
                          .transparent), // Fondo transparente dentro del clip
                  accountName: Text(
                    'Josué Merino',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    'Software Dev',
                    style: TextStyle(color: Colors.grey),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('user.jpg'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.payment, color: Colors.white),
                    title: Text('Pagos de servicios básicos',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => _launchURL('https://www.pichincha.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lightbulb, color: Colors.white),
                    title: Text('Empresa eléctrica',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => _launchURL(
                        'https://www.eeq.com.ec/consulte-su-factura'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.white),
                    title: Text('CNT', style: TextStyle(color: Colors.white)),
                    onTap: () => _launchURL('https://www.cnt.com.ec'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFF01C3A8),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, size: 30),
            label: 'Transacciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 30),
            label: 'Ubicación',
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Grupo 1",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "NRC: 2512",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 16),
          Lottie.asset(
            'cat.json',
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
