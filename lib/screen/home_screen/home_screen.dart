import 'package:finance_house_test/app/bloc/theme_bloc.dart';
import 'package:finance_house_test/core/style/app_colors.dart';
import 'package:finance_house_test/core/widgets/text/base_text.dart';
import 'package:finance_house_test/screen/home_screen/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/card/section_viewer.dart';
import '../../utlis/injection.dart';
import 'widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ThemeBloc? themeBloc = sl<ThemeBloc>();
  final MovieBloc? movieBloc = sl<MovieBloc>();

  @override
  void initState() {
    movieBloc!.add(FetchPopularMovies(1));
    movieBloc!.add(FetchNowPlayingMovies(1));
    movieBloc!.add(FetchTopRatedMovies(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {},
            child: Icon(Icons.search)),
        actions: [

          BlocBuilder<ThemeBloc, ThemeState>(
            bloc: themeBloc,
            builder: (context, state) {
              return InkWell(
                  onTap: () {
                    themeBloc!.add(ToggleThemeEvent());
                  },
                  child: state.isDarkTheme ? Icon(
                      Icons.dark_mode, color: AppColors.primaryColor) : Icon(
                      Icons.light_mode, color: AppColors.primaryDarkColor));
            },
          )

        ],
      ),
      body: SingleChildScrollView(
        child: BlocListener<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: BaseText(title:state.message)),
              );
            }
          },
          child: BlocBuilder<MovieBloc, MovieState>(
            bloc: movieBloc,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (state is PopularMoviesLoading) ...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Popular Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: 0,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => SizedBox(),
                    ),
                  ]
                  else if(state is PopularMoviesLoaded)...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Popular Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: state.movies.results!.length,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => MovieCard(movie: state.movies.results![index]),
                    ),
                  ],

                  if (state is TopRatedMoviesLoading) ...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Top Rated Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: 0,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => SizedBox(),
                    ),
                  ]
                  else if(state is TopRatedMoviesLoaded)...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Top Rated Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: state.movies.results!.length,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => MovieCard(movie: state.movies.results![index]),
                    ),
                  ],

                  if (state is NowPlayingMoviesLoading) ...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Now Playing Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: 0,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => SizedBox(),
                    ),
                  ]
                  else if(state is NowPlayingMoviesLoaded)...[
                    const SizedBox(height: 10),
                    SectionViewer(
                      title: 'Now Playing Movies',
                      viewAllFunc: () {},
                      isLoading: true,
                      itemCount: state.movies.results!.length,
                      controller: ScrollController(),
                      itemBuilder: (context, index) => MovieCard(movie: state.movies.results![index]),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
