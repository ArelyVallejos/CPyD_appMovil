import 'package:cpyd/components/touchable_list_item.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Text(
            "Grupo K",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20.0),
          const Integrante(
            image: "Arely",
            name: "     Luz Castro Vallejos",
            about:
                "       Como me hubiera gustado aprender flutter el verano pasado.",
          ),
          const SizedBox(height: 20.0),
          const Integrante(
            image: "Ian",
            name: "     Ian Battistoni Fuentes",
            about: "       Hey! nada que ver por aqui.",
          ),
          const SizedBox(height: 20.0),
          const Integrante(
            image: "vicente",
            name: "     Vicente Velásquez",
            about: "       Fue un duro semestre.",
          ),
          const SizedBox(height: 30.0),
          const Divider(thickness: 1.0),
          const SizedBox(height: 10.0),
          Text(
            "Repositorio de la Aplicación",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const TouchableListItem(
              icon: Icons.link_rounded,
              title: "GitHub",
              description:
                  "Puedes encontrar el código en este sitio: https://github.com/ArelyVallejos/cpyd",
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(thickness: 1.0),
          const SizedBox(height: 10.0),
          Text(
            "Sobre la Asignatura",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Computación paralela y distribuída",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Profesor Sebastián Salazar Molina",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10.0),
          Text(
            "Primer semestre 2023",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10.0),
          const Divider(thickness: 1.0),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class Integrante extends StatelessWidget {
  const Integrante({
    Key? key,
    required this.image,
    required this.name,
    required this.about,
  }) : super(key: key);

  final String image;
  final String name;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.asset("lib/assets/images/$image.png"),
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 20.0,
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40.0,
                  child: Text(
                    about,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
