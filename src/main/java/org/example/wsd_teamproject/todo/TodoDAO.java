package org.example.wsd_teamproject.todo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public int updateCompleted(int id, boolean completed) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("completed", completed);
        return sqlSession.update("Todo.updateCompleted", params);
    }

    // 검색 메서드
    public List<TodoVO> searchTodos(String searchType, String query) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchType", searchType);
        params.put("query", "%" + query + "%"); // LIKE 연산자에 사용할 와일드카드 포함
        return sqlSession.selectList("Todo.searchTodos", params);
    }
}
