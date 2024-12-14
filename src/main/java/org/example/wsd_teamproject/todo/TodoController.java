package org.example.wsd_teamproject.todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;

@Controller
@RequestMapping("/todo")
public class TodoController {
    @Autowired
    TodoService todoService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

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

//    // Todo 작성 페이지 이동
//    @GetMapping("/create")
//    public String createTodoPage() {
//        return "create"; // create.jsp로 포워딩
//    }
//
//    // Todo 생성
//    @PostMapping("/create")
//    public String createTodo(@ModelAttribute TodoVO todo) {
//        todoService.insertTodo(todo); // insertTodo() 메서드 사용
//        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createTodoPage() {
        return "create";
    }

    @RequestMapping(value = "/createok", method = RequestMethod.POST)
    public String createTodoOK(TodoVO vo) {
        int i = todoService.insertTodo(vo);
        if (i == 0) System.out.println("할 일 추가 실패");
        else System.out.println("할 일 추가 성공!");
        return "redirect:/todo/list";
    }

    // Todo 수정 페이지 이동
//    @GetMapping("/edit/{id}")
//    public String editTodoPage(@PathVariable("id") int id, Model model) {
//        TodoVO todo = todoService.getTodo(id); // getTodo() 메서드로 수정
//        model.addAttribute("todo", todo);
//        return "edit"; // edit.jsp로 포워딩
//    }

//    // Todo 수정
//    @PostMapping("/edit")
//    public String editTodo(@ModelAttribute TodoVO todo) {
//        todoService.updateTodo(todo); // updateTodo() 메서드 사용
//        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
//    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editPerson(@PathVariable("id") int id, Model model) {
        TodoVO todoVO = todoService.getTodo(id);
        model.addAttribute("todo", todoVO);
        return "edit";
    }
    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editOK(TodoVO vo) {
        int i = todoService.updateTodo(vo);
        if(i == 0) System.out.println("데이터 수정 실패");
        else System.out.println("데이터 수정 성공!");
        return "redirect:/todo/list";
    }

    // Todo 삭제
//    @GetMapping("/deleteok/{id}")
//    public String deleteTodo(@PathVariable("id") int id) {
//        todoService.deleteTodo(id); // deleteTodo() 메서드 사용
//        return "redirect:/todo/list"; // 목록 페이지로 리다이렉트
//    }
    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePerson(@PathVariable("id") int id) {
        int i = todoService.deleteTodo(id);
        if(i == 0) System.out.println("데이터 삭제 실패");
        else System.out.println("데이터 삭제 성공!");
        return "redirect:../list";
    }

    // Completed 상태 업데이트
    @PostMapping("/updateCompleted")
    @ResponseBody
    public String updateCompleted(@RequestParam int id, @RequestParam boolean completed) {
        todoService.updateCompleted(id, completed);
        return "success";
    }

    // 검색 기능
    @GetMapping("/search")
    public String searchTodos(@RequestParam String searchType, @RequestParam String query, Model model) {
        List<TodoVO> searchResults = todoService.searchTodos(searchType, query);
        model.addAttribute("list", searchResults);
        return "list";
    }
}
