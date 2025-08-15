import 'package:flutter/material.dart';
import 'package:llsps_new/models/directory_user_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DirUserDetailScreen extends StatelessWidget {
  final DirectoryUser user;

  const DirUserDetailScreen({super.key, required this.user});

  void _launchCaller(String phoneNumber) async {
    final uri = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchWhatsApp(String phone) async {
    final Uri url = Uri.parse("https://wa.me/$phone");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(user.imagePath),
                ),
                const SizedBox(height: 20),
                Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                InfoRow(title: "Member ID", value: user.memberID),
                InfoRow(title: "DOB", value: user.dob),
                InfoRow(title: "Contact No", value: user.contactNo),
                InfoRow(title: "WhatsApp No", value: user.wpContactNo),
                InfoRow(title: "Home Address", value: user.homeAdd),
                InfoRow(title: "Business Name", value: user.busiName),
                InfoRow(title: "Business Address", value: user.busiAdd),
                const SizedBox(height: 140), // space for buttons
              ],
            ),
          ),

          // Bottom-right horizontal buttons
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              children: [
                FloatingActionButton(
                  heroTag: "callBtn",
                  // mini: true,
                  backgroundColor: Colors.green,
                  onPressed: () => _launchCaller(user.contactNo),
                  child: const Icon(Icons.call, size: 25, color: Colors.white),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: "whatsappBtn",
                  // mini: true,
                  backgroundColor: Colors.teal,
                  onPressed: () => _launchWhatsApp(user.wpContactNo),
                  child: const FaIcon(FontAwesomeIcons.whatsapp, size: 30, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
