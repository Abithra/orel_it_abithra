import 'package:flutter/material.dart';
import 'package:orel_it_abithra/presentation/theme/colors.dart';

class AppCard extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final String? subTitle;
  final String? imageUrl;

  const AppCard({Key? key, this.onTap, required this.title, required this.subTitle, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primary.shade300,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        color: Colors.white,
        elevation: 0,
        child:   ListTile(
          leading: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          title: Text(title!),
          subtitle: Row(
            children:  [
              const Icon(Icons.timelapse_outlined),
              const SizedBox(width:5,),
              Text('author -', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(width:5,),
              Text(subTitle!,style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}