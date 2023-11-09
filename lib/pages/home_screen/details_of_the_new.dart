import 'package:flutter/material.dart';
import 'package:news_application/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsOfNew extends StatelessWidget {
  static const String routeName = "details_of_new";

  const DetailsOfNew({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${args.title} Details",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(args.urlToImage ?? ""),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args.source?.name ?? "",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF79828B),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              args.title ?? "",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF42505C),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              args.description ?? "",
              style: theme.textTheme.displayMedium!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    openUrl(args.url);
                  },
                  icon: Text(
                    "View all article",
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: Colors.blue, fontSize: 18),
                  ),
                  label: const Icon(Icons.forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) return;

    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
