class DirectoryUser {
  final String memberID;
  final String name;
  final String dob;
  final String contactNo;
  final String wpContactNo;
  final String homeAdd;
  final String busiName;
  final String busiAdd;
  final String imagePath;
  final bool isAdSubscriber;

  DirectoryUser({
    required this.memberID,
    required this.name,
    required this.dob,
    required this.contactNo,
    required this.wpContactNo,
    required this.homeAdd,
    required this.busiName,
    required this.busiAdd,
    required this.imagePath,
    this.isAdSubscriber = false,
  });
}
