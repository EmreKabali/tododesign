import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.menu),
                  Spacer(),
                  Text('My Tasks'),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        //TODO We should  change fonts
                        child: Text(
                      '12',
                      style: TextStyle(fontSize: 10),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Task Progress',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 100,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [Text('Task Name')],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //TODO dynamic applies
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.dolutarafi.com/wp-content/uploads/2022/02/Dijital-Hikaye-Anlatimi-1024x576.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 15,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.dolutarafi.com/wp-content/uploads/2022/02/Dolutarafi-Podcast-Kopya-1024x904.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(top: 5, left: 50, child: Text('are working'))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
