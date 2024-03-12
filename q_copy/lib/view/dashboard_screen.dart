import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/model/styles/const/google_fonts.dart';
import 'package:q_copy/model/styles/const/sizedbox.dart';
import 'package:q_copy/model/user_list_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserListApi>(context, listen: false).fetchData();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        title: Center(
            child: Text("Leaderboard page",
                style: GoogleFonts.lato(color: Colors.white))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Region: ",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 17, color: Colors.white)),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  height: 35,
                  width: 120,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        "Kozhikode",
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // rank Holders-----------------
            const RankHolders(),
            kHeight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Username",
                  style: latoW,
                ),
                Text(
                  "Points",
                  style: latoW,
                )
              ],
            ),
            Consumer<UserListApi>(
              builder: (context, dataProvider, child) {
                if (dataProvider.datas.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Leader> datas = dataProvider.datas;
                return Expanded(
                  child: ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      final user = datas[index];

                      return Card(
                        child: ListTile(
                          title: Text(
                            user.name.toString(),
                            style: latoB,
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user.profilePic.toString()),
                          ),
                          trailing: Text(
                            user.points.toString(),
                            style: latoB,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

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
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                datas[1].name.toString(),
                                style: latoBold,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
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
