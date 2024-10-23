import 'package:finance_house_test/core/constant.dart';
import 'package:finance_house_test/core/widgets/images/general_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/text/base_text.dart';
import '../../../model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0)
            ),
            clipBehavior: Clip.antiAlias,
            child: GeneralNetworkImage(
              url: "$baseImgUrl${movie.posterPath}",
              height: 150,
              width: 100,
              boxFit: BoxFit.cover,),
          ),
          const SizedBox(height: 8),
          // Movie Title
          SizedBox(
            width: 100,
            child: BaseText(
              title: movie.title,
              textStyle: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,

            ),
          ),
          const SizedBox(height: 4),
          // Movie Rating
          BaseText(
            title:'⭐ ${movie.voteAverage}',
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}