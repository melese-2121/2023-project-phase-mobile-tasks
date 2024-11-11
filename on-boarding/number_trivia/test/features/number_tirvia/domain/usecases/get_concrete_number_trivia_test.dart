import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import "package:flutter_test/flutter_test.dart";

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main(DateTime) {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
}
