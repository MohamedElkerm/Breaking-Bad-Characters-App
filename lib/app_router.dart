import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/char_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/repo/characters_repo.dart';
import 'package:flutter_breaking/data/web_servises/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/characterdetails.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharCubit charCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charCubit = CharCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (context) => charCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (builder) => const CharacterDetailsScreen()
        );
    }
  }
}
