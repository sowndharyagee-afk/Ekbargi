// TAB 1: COMPLAINT PAGE - 21 CATEGORY + MY COMPLAINTS
class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Banking', 'icon': Icons.account_balance},
    {'name': 'Credit Card', 'icon': Icons.credit_card},
    {'name': 'Loans', 'icon': Icons.payments},
    {'name': 'Telecom', 'icon': Icons.cell_tower},
    {'name': 'Airlines', 'icon': Icons.flight},
    {'name': 'E-commerce', 'icon': Icons.shopping_cart},
    {'name': 'Police', 'icon': Icons.local_police},
    {'name': 'Municipal', 'icon': Icons.location_city},
    {'name': 'Electricity', 'icon': Icons.bolt},
    {'name': 'FMCG', 'icon': Icons.local_grocery_store},
    {'name': 'Auto', 'icon': Icons.directions_car},
    {'name': 'Digital Fraud', 'icon': Icons.gpp_bad},
    {'name': 'Education', 'icon': Icons.school},
    {'name': 'Hospital', 'icon': Icons.local_hospital},
    {'name': 'Cabs', 'icon': Icons.local_taxi},
    {'name': 'Delivery Apps', 'icon': Icons.delivery_dining},
    {'name': 'Land', 'icon': Icons.landscape},
    {'name': 'Govt Department', 'icon': Icons.account_balance_wallet},
    {'name': 'Mobiles', 'icon': Icons.smartphone},
    {'name': 'Laptops', 'icon': Icons.laptop_mac},
    {'name': 'Others', 'icon': Icons.more_horiz}, // 21st - TERA WALA
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Register Your Complaint',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Apni shikayat darj kare',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 20),

        // CATEGORY GRID - 21 OPTIONS
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cat['name']} form V2 me khulega'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cat['icon'], size: 32, color: const Color(0xFFFF9933)),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        cat['name'],
                        style: const TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 30),
        const Divider(thickness: 1),
        const SizedBox(height: 16),

        // MY COMPLAINTS SECTION
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Complaints',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Full list V2 me aayegi')),
                );
              },
              child: const Text('View All')
            ),
          ],
        ),
        const SizedBox(height: 12),

        // DUMMY COMPLAINT LIST - V2 me Supabase se aayegi
        _buildComplaintTile('EKB202601234', 'Electricity', 'In Progress', Colors.orange),
        _buildComplaintTile('EKB202601120', 'Telecom', 'Resolved', Colors.green),
        _buildComplaintTile('EKB202601045', 'Others', 'Submitted', Colors.grey),

        const SizedBox(height: 20),
        Center(
          child: Text(
            'V2 me yaha aapki asli complaints dikhengi',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildComplaintTile(String id, String category, String status, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Text(category[0], style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ),
        title: Text(id, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('$category • $status'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
