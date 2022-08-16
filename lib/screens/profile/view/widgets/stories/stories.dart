import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key,required this.color}) : super(key: key);
 final Color color;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<Responsive>(
            builder: (context, value, child) => 
            Container(
                height: 
                value.device == 'mobile' ? 150 :
                150,
                width:
                 value.device == 'mobile' ? 80 :
                 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: color),
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'http://1.bp.blogspot.com/-NP0zmaopjRE/UhhnlfaNsrI/AAAAAAAAEuE/Z5HQX6Jhqik/s1600/a+(9).jpg'),
                        fit: BoxFit.cover)),
              ),
          ),
        );
      },
    );
  }
}
