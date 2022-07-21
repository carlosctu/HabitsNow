import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:habits_now_app/presenter/home/home_page.dart';

import '../../calendar/calendar_page.dart';
import '../database.dart';
import '../review.dart';
import '../widgets/review_card_widget.dart';
import 'edit_delete_review.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  // Lista de todas nossas notas
  late List<Review> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Método para fazer o refresh
    refreshNotes();
  }

  @override
  void dispose() {
    ReviewsDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    // Neste método lemos todas os objetos da classe dentro da nossa DB
    this.notes = await ReviewsDatabase.instance.readAllReviews();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Reviews HabitsNow',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildNotes(),
        ),
      );

// Para mostrar todos os objetos da classe
  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          // ao clickar te leva para os dados da classe note
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteDetailPage(
                    noteId: note.id!,
                  ),
                ),
              );
              refreshNotes();
            },
            child: ReviewCardWidget(
              review: note,
              index: index,
            ),
          );
        },
      );
}
