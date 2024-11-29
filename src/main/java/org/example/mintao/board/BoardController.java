package org.example.mintao.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardDAO boardDAO;

    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
    public String boardList(Model model,
                            @RequestParam(value = "search", required = false, defaultValue = "") String search,
                            @RequestParam(value = "sort", required = false) String sort) {
        List<BoardVO> list;

        // 검색과 정렬 기준에 따라 리스트 불러오기
        if (search != null && !search.isEmpty()) {
            list = boardDAO.searchBoard(search); // 검색된 목록
        } else {
            if (sort != null) {
                if (sort.equals("cnt")) {
                    list = boardDAO.getBoardListSortedByCnt(); // 조회수 순 정렬
                } else if (sort.equals("regdate")) {
                    list = boardDAO.getBoardListSortedByRegdate(); // 등록일 최신 순 정렬
                } else {
                    list = boardDAO.getBoardList(); // 기본 리스트
                }
            } else {
                list = boardDAO.getBoardList(); // 기본 리스트
            }
        }

        model.addAttribute("list", list);
        return "list";
    }


    @RequestMapping(value="/board/add", method = RequestMethod.GET)
    public String addForm() {
        return "write";
    }

    @RequestMapping(value = "/board/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo) {
        int i = boardDAO.insertBoard(vo);
        if (i == 0)
            System.out.println("데이터 추가 실패");
        else
            System.out.println("데이터 추가 성공!!!");
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/edit/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model){
        BoardVO boardVO = boardDAO.getBoard(id);
        model.addAttribute("boardVO", boardVO);
        return "edit";
    }

    @RequestMapping(value = "/board/editok", method = RequestMethod.POST)
    public String editPostOK(BoardVO vo){
        int i = boardDAO.updateBoard(vo);
        if(i == 0)
            System.out.println("데이터 수정 실패");
        else
            System.out.println("데이터 수정 성공!!!\n value of i: "+i);
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/deleteok/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id) {
        int i = boardDAO.deleteBoard(id);
        if (i == 0)
            System.out.println("데이터 삭제 실패");
        else
            System.out.println("데이터 삭제 성공!!!");
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/view/{id}", method = RequestMethod.GET)
    public String viewPost(@PathVariable("id") int id, Model model) {
        // 조회수 증가
        BoardVO boardVO = boardDAO.getBoard(id);
        boardDAO.increaseViewCount(id);  // 조회수 증가
        model.addAttribute("boardVO", boardVO);
        return "view";
    }


    @RequestMapping(value = "/board/search", method = RequestMethod.GET)
    public String searchBoard(@RequestParam("keyword") String keyword, Model model) {
        List<BoardVO> resultList = boardDAO.searchBoard(keyword);
        model.addAttribute("list", resultList);
        model.addAttribute("keyword", keyword);
        return "list";
    }


}

