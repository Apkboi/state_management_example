import 'package:flutter/material.dart';
import 'package:state_management_example/helpers/api_helper.dart';
import 'package:state_management_example/model/movies_response.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  const MovieItemWidget(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IntrinsicHeight(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 16.0),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${movie.title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Director: Zubby J.',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text('Time: 120mins',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const Text(
                              '9.1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.yellow),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Row(
                                  children: List.generate(
                                      5,
                                      (index) => const Text('✭',
                                          style: TextStyle(
                                              color: Colors.yellow))).toList()),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          Positioned(
            top: -35,
            left: 24,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    '${ApiHelper.imageBaseUerl}${movie.posterPath}',
                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
