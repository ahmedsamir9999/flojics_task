import 'package:flojics_task/movies/presentation/screens/video_play_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/movie_provider.dart';

class DetailMovieShoeScreen extends StatelessWidget {
  const DetailMovieShoeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(prov.singleMovie!.coverUrl,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.linear_scale,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 135.h,
              ),
              InkWell(
                onTap: () async
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideoScreen(
                    url: prov.singleMovie!.trailerUrl,
                  )));
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.play_arrow, size: 35.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Play Trailer",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              )
            ],
          ),
          Positioned(
            top: 250.h,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 198.w,
                        child: Text(
                          prov.singleMovie!.title,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border))
                    ]),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Length",
                                style: TextStyle(color: Colors.grey)),
                            Text(prov.singleMovie!.duration.toString()),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Director",
                                style: TextStyle(color: Colors.grey)),
                            Text(prov.singleMovie!.director),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Phase",
                                style: TextStyle(color: Colors.grey)),
                            Text(prov.singleMovie!.phase.toString()),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Description",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      prov.singleMovie!.overview,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Related Movies",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 5.sp,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 283.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20.w,
                            height: 20.h,
                          ),
                          padding: EdgeInsets.only(right: 20.w),
                          itemBuilder: (context, index) => Column(
                            children: [
                              SizedBox(
                                child: Image.network(
                                  prov.singleMovie!.relatedMovies[index]
                                      .imageUrl,
                                  fit: BoxFit.fill,
                                  width: 80.w,
                                  height: 120.h,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 90.w,
                                child: Text(
                                  prov.singleMovie!.relatedMovies[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          itemCount: prov.singleMovie!.relatedMovies.length < 2
                              ? 1
                              : 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
