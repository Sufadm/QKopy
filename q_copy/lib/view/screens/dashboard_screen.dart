import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:q_copy/controller/users_data.dart';
import 'package:q_copy/styles/google_fonts.dart';
import 'package:q_copy/styles/sizedbox.dart';
import 'package:q_copy/model/user_list_model.dart';
import 'package:q_copy/view/widget/rank_holders.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Provider.of<UserListApi>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
