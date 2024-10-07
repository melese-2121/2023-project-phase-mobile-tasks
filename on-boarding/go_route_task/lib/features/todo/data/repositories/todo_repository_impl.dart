import 'package:connectivity/connectivity.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_data_source.dart';



class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final Connectivity connectivity;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<List<Todo>> getAllTodos() async {
    if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
      // Fetch from remote if online
      final todos = await remoteDataSource.fetchTodosFromServer();
      // Optionally, cache the remote data locally
      todos.forEach(localDataSource.addTodoToDb);
      return todos;
    } else {
      // Fetch from local storage if offline
      return await localDataSource.fetchTodosFromDb();
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
      await remoteDataSource.addTodoToServer(todo);
    }
    await localDataSource.addTodoToDb(todo);
  }

  @override
  Future<void> deleteTodoById(String id) async {
    if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
      await remoteDataSource.deleteTodoFromServer(id);
    }
    await localDataSource.deleteTodoFromDb(id);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
      await remoteDataSource.updateTodoOnServer(todo);
    }
    await localDataSource.updateTodoInDb(todo);
  }
}
