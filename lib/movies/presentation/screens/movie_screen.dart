import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/movie_provider.dart';
import 'detail_Movie_Show_screen.dart';
import 'detail_Tv_show_Screen.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  const Spacer(),
                  Text(
                    "Marvel",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add_alert_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                children: [
                  Text(
                    "Tv Shows",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 21.h,
                      width: 61.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: const Color(0xffE5E4EA))),
                      child: Center(
                          child: Text(
                        "See more",
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 250.h,
              width: MediaQuery.of(context).size.width,
              child: prov.tvShowList == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Center(child: Text('Loading')),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 80.w, vertical: 5.h),
                                    content: const CircularProgressIndicator(),
                                  ));
                          await prov
                              .getSingleTvData(prov.tvShowList![index].id);
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetailTvShowScreen(),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Image.network(
                                  prov.tvShowList![index].imageUrl,
                                  fit: BoxFit.fill,
                                  height: 165.h,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 110.w,
                                child: Text(
                                  prov.tvShowList![index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: 5,
                    ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: Row(
                children: [
                  Text(
                    "Movies",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 21.h,
                      width: 61.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: const Color(0xffE5E4EA))),
                      child: Center(
                          child: Text(
                        "See more",
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 250.h,
              width: 327.w,
              child: prov.movieShowList == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Center(
                                            child: Text('Loading')),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 80.w, vertical: 5.h),
                                        content:
                                            const CircularProgressIndicator(),
                                      ));
                              await prov.getSingleMovieData(
                                  prov.tvShowList![index].id);
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const DetailMovieShoeScreen(),
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    prov.movieShowList![index].imageUrl,
                                    height: 80.w,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(prov.movieShowList![index].title,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(prov.movieShowList![index].director),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(prov
                                          .movieShowList![index].releaseDate),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                      itemCount: 5),
            )
          ],
        ),
      )),
    );
  }
}
