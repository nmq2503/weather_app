import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.nameLocation});

  final String nameLocation;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MM-yyyy");

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/ic_location.png"),
            SizedBox(
              width: 10,
            ),
            Text(
              nameLocation,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Text(
          // Thêm thư viện "intl" để lấy được kiểu dữ liệu ngày tháng năm
          dateFormat.format(
            DateTime.now(),
          ),
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
