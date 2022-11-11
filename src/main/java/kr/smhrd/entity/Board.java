package kr.smhrd.entity;

import java.util.Date;

import lombok.Data;

// 게시판(Object)->번호, 제목, 내용, 작성자, 작성일, 조회수,,,,,,,,,,
@Data
public class Board {
  private Long idx;
  // 회원ID
  private String memId;
  private String title;
  private String content;
  private String writer;
  private Date indate;  //Data->String
  private Long count;
  // 답변형 게시판에 추가(4)
  private int bgroup; // 부모글(원글)과 답글을 묶는 역할(0, 1, 2.....)(내림차순)
  private int bseq; // 답글의 순서(오름차순)
  private int blevel; //답글의 레벨(들여쓰기) 
  private int bdelete; // 삭제여부(1=삭제, 0=비삭제)    
}
