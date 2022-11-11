package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Member {
  private String memId;
  private String memPwd;
  private String memName;
  // setter, getter - Lombok API
  
}
