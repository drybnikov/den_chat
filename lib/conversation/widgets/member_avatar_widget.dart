import 'package:flutter/material.dart';

class MemberAvatar extends StatelessWidget {
  final String member;

  const MemberAvatar({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: CircleAvatar(
        backgroundColor: Color(member.hashCode + 0x5500FF33),
        child: Text(member.substring(0, 2)),
      ),
    );
  }
}
