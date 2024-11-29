package org.example.mintao.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {
    @Autowired
    JdbcTemplate template;
    private final String BOARD_INSERT = "insert into BOARD(title, writer, content) values(?,?,?)";
    private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=? where seq=?";
    private final String BOARD_DELETE = "delete from BOARD where seq=?";
    private final String BOARD_GET = "select * from BOARD where seq=?";
    private final String BOARD_LIST = "select * from BOARD order by seq desc";
    private final String BOARD_SEARCH = "SELECT * FROM BOARD WHERE title LIKE ? OR content LIKE ? OR writer LIKE ? ORDER BY seq DESC";
    private final String BOARD_INCREASE_CNT = "update BOARD set cnt = cnt + 1 where seq = ?";

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    public int insertBoard(BoardVO vo){
        return template.update(BOARD_INSERT, new Object[]{vo.getTitle(), vo.getWriter(), vo.getContent()});
    }
    public int deleteBoard(int id){
        return template.update(BOARD_DELETE,new Object[]{id});
    }
    public int updateBoard(BoardVO vo){
        try {
            return template.update(BOARD_UPDATE,new Object[]{vo.getTitle(), vo.getWriter(), vo.getContent(), vo.getSeq()});
        } catch (Exception e) {
            System.err.println("Exception occurred while updating a board: " + e.getMessage());
        }
        System.out.println("Couldn't return template.update method's return value");
        return 0;
    }

    public BoardVO getBoard(int seq){
        return template.queryForObject(BOARD_GET, new Object[] {seq}, new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
    }
    public List<BoardVO> getBoardList(){
        return template.query(BOARD_LIST, new RowMapper<BoardVO>(){
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException{
                BoardVO data = new BoardVO();
                data.setSeq(rs.getInt("seq"));
                data.setTitle(rs.getString("title"));
                data.setRegdate(rs.getDate("regdate"));
                data.setWriter((rs.getString("writer")));
                data.setCnt((rs.getInt("cnt")));
                return data;
            }
        });
    }

    public int increaseViewCount(int seq) {
        return template.update(BOARD_INCREASE_CNT, seq);
    }

    public List<BoardVO> searchBoard(String keyword) {
        return template.query(BOARD_SEARCH, new Object[]{
                        "%" + keyword + "%",
                        "%" + keyword + "%",
                        "%" + keyword + "%"
                },
                new RowMapper<BoardVO>() {
                    @Override
                    public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                        BoardVO data = new BoardVO();
                        data.setSeq(rs.getInt("seq"));
                        data.setTitle(rs.getString("title"));
                        data.setContent(rs.getString("content"));
                        data.setWriter(rs.getString("writer"));
                        data.setRegdate(rs.getDate("regdate"));
                        data.setCnt(rs.getInt("cnt"));
                        return data;
                    }
                });
    }

    public List<BoardVO> getBoardListSortedByCnt() {
        String sql = "SELECT * FROM BOARD ORDER BY cnt DESC";
        return template.query(sql, new RowMapper<BoardVO>() {
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                BoardVO data = new BoardVO();
                data.setSeq(rs.getInt("seq"));
                data.setTitle(rs.getString("title"));
                data.setContent(rs.getString("content"));
                data.setWriter(rs.getString("writer"));
                data.setRegdate(rs.getDate("regdate"));
                data.setCnt(rs.getInt("cnt"));
                return data;
            }
        });
    }

    public List<BoardVO> getBoardListSortedByRegdate() {
        String sql = "SELECT * FROM BOARD ORDER BY regdate ASC";
        return template.query(sql, new RowMapper<BoardVO>() {
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                BoardVO data = new BoardVO();
                data.setSeq(rs.getInt("seq"));
                data.setTitle(rs.getString("title"));
                data.setContent(rs.getString("content"));
                data.setWriter(rs.getString("writer"));
                data.setRegdate(rs.getDate("regdate"));
                data.setCnt(rs.getInt("cnt"));
                return data;
            }
        });
    }


}
