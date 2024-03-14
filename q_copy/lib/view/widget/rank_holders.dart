import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/model/user_list_model.dart';
import 'package:q_copy/styles/google_fonts.dart';
import 'package:q_copy/styles/sizedbox.dart';

class RankHolders extends StatelessWidget {
  const RankHolders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rankIndex = 0;
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Consumer<UserListApi>(
      builder: (context, value, child) {
        List<Leader> datas = value.datas;
        datas.sort((a, b) => b.points!.compareTo(a.points!));

        if (rankIndex < datas.length) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10)),
                        color: Color.fromARGB(255, 194, 193, 193),
                      ),
                      margin: EdgeInsets.only(top: screenHeight * 0.1),
                      height: screenHeight * 0.15,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kHeight15,
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                datas[1].name.toString(),
                                style: latoBold,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  datas[1].points.toString(),
                                  style: latoB,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      margin: EdgeInsets.only(top: screenHeight * 0.05),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[1].profilePic.toString()),
                          radius: screenWidth * 0.1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.yellow,
                      ),
                      margin: EdgeInsets.only(top: screenHeight * 0.05),
                      height: screenHeight * 0.2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                datas[0].name.toString(),
                                style: latoBold,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  datas[0].points.toString(),
                                  style: latoB,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.yellow,
                          width: 2.0,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[0].profilePic.toString()),
                          radius: screenWidth * 0.11,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.orange,
                      ),
                      margin: EdgeInsets.only(top: screenHeight * 0.1),
                      height: screenHeight * 0.15,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kHeight25,
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                datas[2].name.toString(),
                                style: latoBold,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  datas[2].points.toString(),
                                  style: latoB,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                      margin: EdgeInsets.only(top: screenHeight * 0.060),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[2].profilePic.toString()),
                          radius: screenWidth * 0.1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
