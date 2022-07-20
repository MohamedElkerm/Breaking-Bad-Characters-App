import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/char_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';

import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/presentation/widgets/characters_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharCubit, CharState>(
      builder: (context, state) {
        if (state is CharLoaded) {
          allCharacters = (state).character;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: Image.asset('assets/images/loading.gif')
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          characters: allCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text("Characters", style: TextStyle(color: MyColors.myGrey,),),
      ),
      body: buildBlocWidget(),

    );
  }
}
