import 'package:movie_app1/modelo/person_response.dart';
import 'package:movie_app1/repositorio/repositorio.dart';
import 'package:rxdart/subjects.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getMovies() async {
    PersonResponse response = await _repository.getPersons(0);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;

  getPersons() {}
}

final personsBloc = PersonsListBloc();
