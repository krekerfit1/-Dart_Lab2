import 'dart:io';

import 'package:lab2_todo/todo.dart';

void main() {
  List<Todo> todos = [];

  while (true) {
    print('\n--- ToDo Приложение ---');
    print('1. Показать все задачи');
    print('2. Добавить задачу');
    print('3. Отметить как выполненную');
    print('4. Выйти');
    stdout.write('Выберите действие: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        showTodos(todos);
        break;
      case '2':
        addTodo(todos);
        break;
      case '3':
        completeTodo(todos);
        break;
      case '4':
        print('До свидания!');
        return;
      default:
        print('Неверный ввод, попробуйте снова.');
    }
  }
}

void showTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print('Список задач пуст');
    return;
  }
  print('\nСписок задач:');
  for (var task in todos) {
    print(task);
  }
}

void addTodo(List<Todo> todos) {
  stdout.write('Название задачи: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Ошибка: название не может быть пустым');
    return;
  }

  todos.add(Todo(title: input.trim()));
  print('Задача добавлена!');
}

void completeTodo(List<Todo> todos) {
  if (todos.isEmpty) {
    print('Список задач пуст');
    return;
  }

  stdout.write('Введите ID задачи для отметки: ');
  String? input = stdin.readLineSync();
  int? id = int.tryParse(input ?? '');

  if (id == null) {
    print('Ошибка: введите корректное число');
    return;
  }

  for (var task in todos) {
    if (task.id == id) {
      task.complete();
      print('Задача "${task.title}" отмечена как выполненная!');
      return;
    }
  }

  print('Задача с ID $id не найдена');
}
