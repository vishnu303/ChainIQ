import 'package:flutter/material.dart';

class CustomNewsTile extends StatelessWidget {
  const CustomNewsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber,
      ),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/31008025/pexels-photo-31008025.jpeg',
                    ),
                  ),
                  Text(
                    'Hello',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'NEwwwwwwwwwwwwwwwwwwwwzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',
                  maxLines: 3,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              Text(
                'time',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: double.infinity,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
