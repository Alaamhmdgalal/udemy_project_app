import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
             radius: 25.0,
             backgroundImage: NetworkImage(
               'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'
             ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){

          },
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.grey.withOpacity(0.5),
                child: const Icon(
                  Icons.camera_alt,
                  size: 15.0,
                  color: Colors.white,
                ),
              )
          ),
          IconButton(onPressed: (){

          },
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.grey.withOpacity(0.5),
                child: const Icon(
                  Icons.edit,
                  size: 15.0,
                  color: Colors.white,
                ),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 110.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                  itemCount: 7,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemCount: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'
            ),
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      const SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alaa Mohamed Galal Eldin',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hi my name is alaa mohamed',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Text(
                  '10:52 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'
              ),
            ),
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        const Text(
          'Alaa Mohamed Galal Eldin',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}