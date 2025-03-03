import 'package:flutter/material.dart';

void main() {
  runApp(const FinancePlannerApp());
}

class FinancePlannerApp extends StatelessWidget {
  const FinancePlannerApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planificador Financiero',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const FinanceScreen(),
    );
  }
}

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({ super.key });

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _debtController = TextEditingController();

  double _totalIncome = 0;
  double _totalExpenses = 0;
  double _totalDebt = 0;

  void _addIncome() {
    setState(() {
      _totalIncome += double.tryParse(_incomeController.text) ?? 0;
      _incomeController.clear();
    });
  }

  void _addExpense() {
    setState(() {
      _totalExpenses += double.tryParse(_expenseController.text) ?? 0;
      _debtController.clear();
    });
  }

  void _addDebt() {
    setState(() {
      _totalDebt += double.tryParse(_debtController.text) ?? 0;
      _debtController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planificador Financiero')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingresos: \$$_totalIncome', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _incomeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Añadir ingreso'),
            ),
            ElevatedButton(onPressed: _addIncome, child: const Text('Agregar ingreso')),
            const SizedBox(height: 20),
            Text('Gastos: \$$_totalExpenses', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _expenseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Añadir gasto')
            ),
            ElevatedButton(onPressed: _addExpense, child: const Text('Agregar gasto')),
            const SizedBox(height: 20),
            Text('Deudas: \$$_totalDebt', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _debtController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Aladir deuda')
            ),
            ElevatedButton(onPressed: _addDebt, child: const Text('Agregar deuda'))
          ]
        )
      )
    );
  }
}