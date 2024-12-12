package org.example.wsd_teamproject.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl {

    @Autowired
    private MemberDAO memberDAO;

    public MemberVO getMember(MemberVO vo) {
        return memberDAO.getMember(vo);
    }
}
