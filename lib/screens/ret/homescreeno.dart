import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Products Overview'),
            _buildOverviewCards(),
            _sectionTitle('Boosted Products Performance'),
            _buildPerformanceCards(),
            _sectionTitle('Highly In-Demand Products'),
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Image.asset('assets/logo.png', height: 30),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Column(
      children: [
        _buildStatRow([
          _buildStatCard('Total Products', '284', '+12%'),
          _buildStatCard('Active Products', '156', '+8%'),
        ]),
        _buildStatRow([
          _buildStatCard('Available for Rent', '98', '-3%'),
          _buildStatCard('User Requests', '426', '+15%'),
        ]),
      ],
    );
  }

  Widget _buildPerformanceCards() {
    return _buildStatRow([
      _buildPerformanceCard('Total Reach', '15.2K', Icons.visibility),
      _buildPerformanceCard('Total Clicks', '3.8K', Icons.touch_app),
    ]);
  }

  Widget _buildStatRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }

  Widget _buildStatCard(String title, String value, String percentage) {
    bool isNegative = percentage.contains('-');
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(percentage, style: TextStyle(color: isNegative ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard(String title, String value, IconData icon) {
    return _buildCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          Icon(icon, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        _buildProductCard('Nike Air Max 2024', 'assets/nike_shoe.jpg', '2.4k', '126'),
        _buildProductCard('Leather Wallet Pro', 'assets/leather_wallet.jpg', '1.8k', '94'),
      ],
    );
  }

  Widget _buildProductCard(String title, String imagePath, String views, String requests) {
    return _buildCard(
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Views: $views', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text('Requests: $requests', style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3)),
        ],
      ),
      child: child,
    );
  }
}
