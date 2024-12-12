package org.example.wsd_teamproject.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    public MemberVO getMember(MemberVO vo) {
        return sqlSession.selectOne("member.getMember", vo);
    }
}
