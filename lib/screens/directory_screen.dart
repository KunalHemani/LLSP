import 'package:flutter/material.dart';
import 'package:llsps_new/models/directory_user_model.dart';
import 'package:llsps_new/screens/dir_user_detail_screen.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  final List<DirectoryUser> users = [
    DirectoryUser(
      memberID: "101",
      name: 'Kunal Hemani',
      dob: '01-01-1998',
      contactNo: '+919428745235',
      wpContactNo: '916353355410',
      homeAdd: '123 Sindhi Colony, Surat',
      busiName: 'Hemani Traders',
      busiAdd: 'Ring Road, Surat',
      imagePath: 'assets/images/sl.jpg',
      isAdSubscriber: true,
    ),
    // Add more users here
  ];

  List<DirectoryUser> filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  String selectedSort = 'Name (A-Z)';

  @override
  void initState() {
    super.initState();
    filteredUsers = List.from(users);
    applySort();
  }

  void filterUsers(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredUsers = users.where((user) {
        return user.name.toLowerCase().contains(lowerQuery) ||
            user.busiName.toLowerCase().contains(lowerQuery) ||
            user.memberID.toLowerCase().contains(lowerQuery);
      }).toList();
      applySort();
    });
  }

  void applySort() {
    setState(() {
      switch (selectedSort) {
        case 'Name (A-Z)':
          filteredUsers.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Name (Z-A)':
          filteredUsers.sort((a, b) => b.name.compareTo(a.name));
          break;
        case 'Member ID (Low to High)':
          filteredUsers.sort((a, b) => int.parse(a.memberID).compareTo(int.parse(b.memberID)));
          break;
        case 'Member ID (High to Low)':
          filteredUsers.sort((a, b) => int.parse(b.memberID).compareTo(int.parse(a.memberID)));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directory'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: filterUsers,
              decoration: InputDecoration(
                hintText: 'Search by name, business name, or member ID',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Row(
              children: [
                const Text('Sort by: '),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedSort,
                  items: [
                    'Name (A-Z)',
                    'Name (Z-A)',
                    'Member ID (Low to High)',
                    'Member ID (High to Low)'
                  ].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedSort = value;
                        applySort();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(user.imagePath),
                  ),
                  title: Text(user.name),
                  subtitle: Text("ID: ${user.memberID} • ${user.busiName}"),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DirUserDetailScreen(user: user),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
