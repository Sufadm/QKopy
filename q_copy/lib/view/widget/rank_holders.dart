import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/model/user_list_model.dart';
import 'package:q_copy/styles/google_fonts.dart';
import 'package:q_copy/styles/sizedbox.dart';

class RankHolders extends StatelessWidget {
  const RankHolders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var rankIndex = 0;
    return Consumer<UserListApi>(
      builder: (context, value, child) {
        List<Leader> datas = value.datas;
        datas.sort((a, b) => b.points!.compareTo(a.points!));
        if (rankIndex < datas.length) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10)),
                      color: Color.fromARGB(255, 194, 193, 193),
                    ),
                    margin: const EdgeInsets.only(top: 110),
                    height: 110,
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
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              datas[1].points.toString(),
                              style: latoB,
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 55),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[1].profilePic.toString()),
                          radius: 45,
                        ),
                      ))
                ]),
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.yellow,
                    ),
                    margin: const EdgeInsets.only(top: 50),
                    height: 170,
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
                              const SizedBox(
                                width: 5,
                              ),
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
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[0].profilePic.toString()),
                          radius: 45,
                        ),
                      ))
                ]),
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.orange,
                    ),
                    margin: const EdgeInsets.only(top: 130),
                    height: 90,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kHeight25,
                        const SizedBox(
                          width: 5,
                        ),
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
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              datas[2].points.toString(),
                              style: latoB,
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(datas[2].profilePic.toString()),
                          radius: 45,
                        ),
                      ))
                ]),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
