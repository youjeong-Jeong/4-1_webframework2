package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Course {
  private int id;

  private int year;
  private int semester;

  @Size(min = 2, max = 100, message = "2글자 이상 100자 이하로 입력해주세요")
  //@NotEmpty(message="교과코드를 입력해주세요.")
  private String code;

  @Size(min = 2, max = 100, message = "2글자 이상 100자 이하로 입력해주세요")
  //@NotEmpty(message="교과명을 입력해주세요.")
  private String name;

  @Size(min = 2, max = 100, message = "2글자 이상 100자 이하로 입력해주세요")
  //@NotEmpty(message="교과구분을 입력해주세요.")
  private String classification;

  @Size(min = 2, max = 100, message = "2글자 이상 100자 이하로 입력해주세요")
  //@NotEmpty(message="교수명을 입력해주세요.")
  private String professor;

  @Min(value = 1, message = "학점은 최소 1학점이어야 합니다.")
  @Max(value = 15, message = "학점은 최대 15학점이어야 합니다.")
  @NotNull(message = "숫자를 입력해주세요.")
  private Integer credit;

//    @Size(min=2, max=100, message = "Name must be between 2 and 100 chars")
//    private String name;
//
//    @Email(message="Please provide a valid email address")
//    @NotEmpty(message="The email address cannot be empty")
//    private String email;
//
//    @Size(min=5, max=100, message="Text must be between 5 and 100 chars")
//    private String text;
}
