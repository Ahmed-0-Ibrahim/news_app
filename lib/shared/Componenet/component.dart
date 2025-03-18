import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/webview/webview.dart';

import '../../layout/Home/Cubit/States.dart';

Widget articlItem(
  context,
  article,
) {
  var screenSize = MediaQuery.of(context).size;
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(uri: article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.15,
            width: screenSize.width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:article['urlToImage']!=null? NetworkImage(article['urlToImage']):NetworkImage('https://ih1.redbubble.net/image.5055723050.4010/raf,360x360,075,t,fafafa:ca443f4786.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article['title'],
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 3,
                ),
                SizedBox(height:screenSize.height*.04 ,),
                Text(
                  article['publishedAt'],
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articalBuilder(list,state)=>ConditionalBuilder(
  condition: state is! NewsLoadingState,
  builder: (context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Container(
          width: double.infinity, color: Colors.grey, height: 2),
      itemBuilder: (context, index) {
        return articlItem(
            context,
            list[index]
        );
      },
      itemCount: list.length,
    );
  },
  fallback: (context) =>
  const Center(child: CircularProgressIndicator()),
);

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));