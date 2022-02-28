import 'package:flutter/material.dart';
import 'package:wordsreminder/model/Task.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Task> fakeTasks = [
    Task(Colors.green, 0.5, 'Create calendar', 'Calendar'),
    Task(Colors.orange, 0.9, 'Complete your homework', 'Calendar'),
    Task(Colors.blue, 0.4, 'Build a plan ', 'Calendar'),
    Task(Colors.orange, 0.3, 'Give somethings', 'Calendar'),
  ];

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
                height: 20,
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
                height: 330,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: fakeTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      var current = fakeTasks[index];
                      return TaskCard(current);
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ABOUT'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Task Summary',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.segment)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  Task task;

  TaskCard(this.task);

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
            children: [Text(task.description)],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: Container(
                    height: 8,
                    width: MediaQuery.of(context).size.width * task.count,
                    decoration: BoxDecoration(
                        color: task.color,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '%' + (task.count).toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                ' complete',
                style: TextStyle(fontSize: 9),
              )
            ],
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
