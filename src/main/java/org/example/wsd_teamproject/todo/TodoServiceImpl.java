package org.example.wsd_teamproject.todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoServiceImpl implements TodoService{
    @Autowired
    TodoDAO todoDAO;

    @Override
    public int insertTodo(TodoVO vo){
        return todoDAO.insertTodo(vo);
    }

    @Override
    public int updateTodo(TodoVO vo) {
        return todoDAO.updateTodo(vo);
    }

    @Override
    public int deleteTodo(int id) {
        return todoDAO.deleteTodo(id);
    }

    @Override
    public TodoVO getTodo(int id) {
        return todoDAO.getTodo(id);
    }

    @Override
    public List<TodoVO> getTodoList() {
        return todoDAO.getTodoList();
    }

}
