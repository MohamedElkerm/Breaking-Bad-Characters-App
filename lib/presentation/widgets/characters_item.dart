import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character characters;

  const CharacterItem({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
            color: MyColors.myGrey,
            child: characters.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: characters.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/loading.gif')),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${characters.name}',
            style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
