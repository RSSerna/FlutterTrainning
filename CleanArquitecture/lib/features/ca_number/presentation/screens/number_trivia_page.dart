import 'package:cleanarquitecture_numbers_app/features/ca_number/presentation/bloc/numbert_trivia_bloc.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/presentation/widgets/widgets.dart';
import 'package:cleanarquitecture_numbers_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (context, state) {
                if (state is EmptyState) {
                  return const MessageDisplay(message: 'Start Searching!');
                } else if (state is LoadingState) {
                  return const LoadingWidget();
                } else if (state is LoadedState) {
                  return TriviaDisplay(
                    numberTrivia: state.trivia,
                  );
                } else if (state is ErrorState) {
                  return MessageDisplay(
                    message: state.error,
                  );
                }
                return Container();
              }),
              // Container(
              //   // Third of the size of the screen
              //   height: MediaQuery.of(context).size.height / 3,
              //   // Message Text widgets / CircularLoadingIndicator
              //   child: const Placeholder(),
              // ),
              const SizedBox(height: 20),
              // Bottom half
              const TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key? key,
  }) : super(key: key);

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                // color: Theme.of(context).accentColor,
                // textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: dispatchRandom,
                child: const Text('Get random trivia'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumberEvent(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(const GetTriviaForRandomNumberEvent([]));
  }
}
