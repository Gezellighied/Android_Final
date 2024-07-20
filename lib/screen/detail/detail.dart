
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/game.dart';
import 'package:flutter_application_1/screen/detail/cubit/detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../api/api.dart';
import '../../enum/LoadStatus.dart';
import '../../model/Product.dart';
import 'cubit/detail_state.dart';


class Details extends StatelessWidget {
  final int id;
  final String imageUr;
  const Details({super.key, required this.id, required this.imageUr});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCubit>(
      create: (context) => DetailCubit(context.read<Api>())..getdetail(id),
      child: MainDetail(imageUrl: imageUr),
    );
  }
}

class MainDetail extends StatelessWidget {
  final String imageUrl;
  const MainDetail({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
            actions: [
              IconButton(
                  onPressed: () {
                   Game game= state.game;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(

                    //       builder: (context) =>
                    //           Update(product: product,)),
                    // );
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
          body: BlocBuilder<DetailCubit, DetailState>(
            builder: (context, state) {
              switch (state.loadStatus) {
                case LoadStatus.Loading:
                  return const Center(child: CircularProgressIndicator());
                case LoadStatus.Error:
                  return const Center(
                      child: Text("Error loading product details."));
                case LoadStatus.Done:
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.game.thumbnail != null)
                            Image.network(imageUrl),
                          Text(state.game.title ?? 'No title available',
                              style: Theme.of(context).textTheme.headlineLarge),
                          Text('Genre: \$${state.game.genre ?? 'N/A'}',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Text('Platform: \$${state.game.platform ?? 'N/A'}',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Text('Publisher: \$${state.game.publisher ?? 'N/A'}',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Text('Developer: \$${state.game.developer ?? 'N/A'}',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Text('releaseDate: \$${state.game.releaseDate ?? 'N/A'}',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 10),
                          Text('ShortDescription:',
                              style: Theme.of(context).textTheme.headlineSmall),
                          Text(state.game.shortDescription ??
                              'No description available'),
                          Text('Description:',
                              style: Theme.of(context).textTheme.headlineSmall), 
                              HtmlWidget( state.game.description ?? 'No description available'), 
                          Text(state.game.description ??
                              'No description available'),
                          SizedBox(
                          height: 200,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.game.screenshots!.length,
                          itemBuilder: (context, index) {
                            return Image.network(state.game.screenshots![index].image!);
                          },
                        ),
                      )
                        ],
                      ),
                    ),
                  );
                default:
                  return const Center(child: Text("Unknown state"));
              }
            },
          ),
        );
      },
    );
  }
}
