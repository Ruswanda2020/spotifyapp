import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/common/helper/is_dark_mode.dart';
import 'package:spotify_app/core/configs/contstans/app_url.dart';
import 'package:spotify_app/core/configs/theme/app_color.dart';
import 'package:spotify_app/domain/entities/song/song.dart';
import 'package:spotify_app/persentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_app/persentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 220, // Height for the container
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
            if (state is NewsSongsLoaded) {
              return _songs(state.songs);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160, // Width for the image container
          height: 200, // Height for the image container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${AppUrls.coverFirestorage}${songs[index].title}.jpeg?${AppUrls.mediaAlt}"),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 50, // Size of the play button
                      width: 50,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.darkGrey
                            : const Color(0xffE6E6E6),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}
