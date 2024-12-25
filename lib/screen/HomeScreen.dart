import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/shopCubit.dart';
import 'package:flutter_application_1/cubit/shopState.dart';
import 'package:flutter_application_1/models/homeModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcubit, Shopstate>(
      listener: (context, state) {},
      builder: (context, state) {
        // تحقق من حالة التحميل
        if (state is shopLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is shopErrorState) {
          return Center(child: Text("Error: ${state.error}"));
        } else {
          // هنا التأكد من أن homemodel تم تهيئته بنجاح
          return ConditionalBuilder(
            condition: Shopcubit.get(context).homemodel != null,
            builder: (context) => ProductsBuilder(Shopcubit.get(context).homemodel!),
            fallback: (context) => const Center(child: CircularProgressIndicator()), // أثناء التحميل
          );
        }
      },
    );
  }

  Widget ProductsBuilder(Homemodel model) {
    return SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search here...',
                    prefix: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: const Icon(Icons.filter_1_outlined))
            ],
          ),
          const SizedBox(height: 20),


          CarouselSlider(
            items: model.data!.banners
                .map(
                  (e) =>  Image(
            image: NetworkImage(e.image),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(height: 20),

          // الفلاتر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterChip(label: const Text("All"), onSelected: (val) {}),
              FilterChip(label: const Text("Cloth"), onSelected: (val) {}),
              FilterChip(label: const Text("Shoes"), onSelected: (val) {}),
              FilterChip(label: const Text("Bags"), onSelected: (val) {}),
            ],
          ),
          const SizedBox(height: 20),

          // المنتجات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Most Popular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text("View All")),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child:
            Expanded(
            child: GridView.count(
              shrinkWrap: true,

              childAspectRatio: 1/1.6,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                model.data.products.length,
                (index) => ProductBuilder(model.data.products[index]),
              ),
            ),
          ),
          )
        ],
      ),
    ));
  }
Widget ProductBuilder(productsModel model) => Column(
        children: [
          Stack(
            children: 
            [
                Image(
            image: NetworkImage(model.image),
            height: 200,
            width: double.infinity,
            //fit: BoxFit.cover,
          ),
          if(model.discount != 0)
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(5.0),
            child: const Text('descount',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.0,

            ),
            ),
            color: Colors.red,

                      )
         
            ]
          ),
        
                Text(
                  model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                  
                    fontSize: 10.0,
                    height: 1.3,
                  ),
                ),
                 const SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5.0),
                  if (model.old_price != null)
                    Text(
                      '${model.old_price.round()}',
                      style: const TextStyle(
                        fontSize: 10.0,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(),
                      IconButton(
                        alignment: AlignmentDirectional.bottomEnd,
                        onPressed: (){},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          ),
                          
                          
                           ),
                    
                ],
              ),
            ],
          );
        
      
    
              
      

}
