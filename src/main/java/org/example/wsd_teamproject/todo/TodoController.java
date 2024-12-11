package org.example.wsd_teamproject.todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/todo")
public class TodoController {
    @Autowired
    TodoService todoService;

    // Todo 목록 조회
    @GetMapping("/list")
    public String todolist(Model model) {
        model.addAttribute("list", todoService.getTodoList());
        return "list"; // list.jsp로 포워딩
    }

    // Todo 상세 조회
    @GetMapping("/view/{id}")
    public String viewTodo(@PathVariable("id") int id, Model model) {
        TodoVO todo = todoService.getTodo(id); // getTodo() 메서드로 수정
        model.addAttribute("todo", todo);
        return "view"; // view.jsp로 포워딩
    }

    // Todo 작성 페이지 이동
    @GetMapping("/create")
    public String createTodoPage() {
        return "create"; // create.jsp로 포워딩
    }

    // Todo 생성
    @PostMapping("/create")
    public String createTodo(@ModelAttribute TodoVO todo) {
        todoService.insertTodo(todo); // insertTodo() 메서드 사용
        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
    }

    // Todo 수정 페이지 이동
    @GetMapping("/edit/{id}")
    public String editTodoPage(@PathVariable("id") int id, Model model) {
        TodoVO todo = todoService.getTodo(id); // getTodo() 메서드로 수정
        model.addAttribute("todo", todo);
        return "edit"; // edit.jsp로 포워딩
    }

    // Todo 수정
    @PostMapping("/edit")
    public String editTodo(@ModelAttribute TodoVO todo) {
        todoService.updateTodo(todo); // updateTodo() 메서드 사용
        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
    }

    // Todo 삭제
    @GetMapping("/delete/{id}")
    public String deleteTodo(@PathVariable("id") int id) {
        todoService.deleteTodo(id); // deleteTodo() 메서드 사용
        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
    }
}
