package org.example.wsd_teamproject.todo;

import java.util.List;

public interface TodoService {
    public int insertTodo(TodoVO vo);
    public int updateTodo(TodoVO vo);
    public int deleteTodo(int id);
    public TodoVO getTodo(int id);
    public List<TodoVO> getTodoList();
    int updateCompleted(int id, boolean completed);
    List<TodoVO> searchTodos(String searchType, String query);
}
