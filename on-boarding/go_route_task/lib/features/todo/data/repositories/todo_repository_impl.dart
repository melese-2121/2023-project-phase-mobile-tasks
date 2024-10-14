// data/repositories/todo_repository_impl.dart
import 'package:your_project/core/network/network_info.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Todo>> getAllTodos() async {
    if (await networkInfo.isConnected) {
      final todos = await remoteDataSource.fetchTodosFromServer();
      todos.forEach(localDataSource.addTodoToDb); // Cache the remote data
      return todos;
    } else {
      return await localDataSource
          .fetchTodosFromDb(); // Fetch from local if offline
    }
  }

  @override
  Future<void> addTodo(Todo todo) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.addTodoToServer(todo);
    }
    await localDataSource.addTodoToDb(todo); // Always add to local storage
  }

  @override
  Future<void> deleteTodoById(String id) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.deleteTodoFromServer(id);
    }
    await localDataSource
        .deleteTodoFromDb(id); // Always delete from local storage
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.updateTodoOnServer(todo);
    }
    await localDataSource.updateTodoInDb(todo); // Always update local storage
  }
}
