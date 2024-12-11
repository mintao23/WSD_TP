package org.example.wsd_teamproject.todo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TodoDAO {

    @Autowired
    private SqlSession sqlSession;

    public int insertTodo(TodoVO vo) {
        return sqlSession.insert("Todo.insertTodo", vo);
    }

    public int updateTodo(TodoVO vo) {
        return sqlSession.update("Todo.updateTodo", vo);
    }

    public int deleteTodo(int id) {
        return sqlSession.delete("Todo.deleteTodo", id);
    }

    public TodoVO getTodo(int id) {
        return sqlSession.selectOne("Todo.getTodo", id);
    }

    public List<TodoVO> getTodoList() {
        return sqlSession.selectList("Todo.getTodoList");
    }
}
