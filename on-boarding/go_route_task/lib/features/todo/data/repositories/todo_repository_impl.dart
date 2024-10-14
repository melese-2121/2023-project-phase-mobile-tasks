import '../../../../core/network/network_info.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_data_source.dart' as remote;
import '../datasources/todo_local_data_source.dart' as local;

class TodoRepositoryImpl implements TodoRepository {
  final remote.TodoRemoteDataSource remoteDataSource;
  final local.TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo; // Use your custom NetworkInfo class

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Todo>> getAllTodos() async {
    if (await networkInfo.isConnected) {
      // Using your custom NetworkInfo method
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
    if (await networkInfo.isConnected) {
      await remoteDataSource.addTodoToServer(todo);
    }
    await localDataSource.addTodoToDb(todo);
  }

  @override
  Future<void> deleteTodoById(String id) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.deleteTodoFromServer(id);
    }
    await localDataSource.deleteTodoFromDb(id);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.updateTodoOnServer(todo);
    }
    await localDataSource.updateTodoInDb(todo);
  }
}
