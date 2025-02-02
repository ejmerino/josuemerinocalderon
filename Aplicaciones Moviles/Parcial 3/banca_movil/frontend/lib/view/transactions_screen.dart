import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<dynamic> transactions = [];
  bool isLoading = true;
  int? selectedTransactionIndex;

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    final url = Uri.parse('https://dummyjson.com/c/9649-2bf9-4d8b-80f8');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          transactions = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Error al cargar las transacciones');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        /* title: Text(
          "Transacciones",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Jost',
          ),
        ), */
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xFF01C3A8)),
            )
          : transactions.isEmpty
              ? Center(
                  child: Text(
                    "No hay transacciones disponibles",
                    style: TextStyle(color: Colors.white, fontFamily: 'Jost'),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sección de bienvenida
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF2A2E33)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bienvenido!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jost',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Aquí encontrarás tu historial de transacciones",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontFamily: 'Jost',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Lottie.asset(
                                'money.json',
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Lista de transacciones
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            final isSelected =
                                selectedTransactionIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTransactionIndex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(0xFF01C3A8)
                                      : Color(0xFF2A2E33),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transaction['description'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Jost',
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '\$${transaction['amount'].toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Jost',
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        transaction['date'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 14,
                                          fontFamily: 'Jost',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
