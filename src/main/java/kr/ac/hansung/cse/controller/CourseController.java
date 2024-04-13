package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class CourseController {

  // Controller -> Service -> Dao
  @Autowired
  private CourseService courseService;

  @GetMapping("/showcredit")
  public String showCredit(Model model) {
    List<Course> courses = courseService.getAllCourses();

    model.addAttribute("id_courses", courses);

    Map<String, Integer> creditSummary = courseService.getCreditSummaryByYearAndSemester(courses);
    model.addAttribute("creditSummary", creditSummary);


    int totalCredits = courseService.getTotalCredits(courses);
    model.addAttribute("totalCredits", totalCredits);

    return "showcredit"; // JSP 또는 다른 뷰 페이지 이름
  }

  @GetMapping("/coursedetail")
  public String viewCourseDetail(
          @RequestParam("year") int year,
          @RequestParam("semester") int semester,
          Model model) {
    List<Course> courses = courseService.getCoursesByYearAndSemester(year, semester);
    model.addAttribute("courses", courses);

    return "coursedetail"; // 상세 정보를 표시할 JSP 파일 이름
  }

  @GetMapping("/createcourse")
  public String createcourse(Model model) {
    model.addAttribute("course", new Course());

    return "createcourse";
  }

  @PostMapping("/docreate")
  public String doCreate(Model model, @Valid Course course, BindingResult result) {

    if (result.hasErrors()) {
      System.out.println("== Form data does not validated ==");

      List<ObjectError> errors = result.getAllErrors();

      for (ObjectError error : errors) {
        System.out.println(error.getDefaultMessage());
      }

      return "createcourse";
    }

    int year = 2024;
    int semester = 2;
    // Course 객체에 년도와 학기를 설정
    course.setYear(year);
    course.setSemester(semester);

    // Controller -> Service -> Dao
    courseService.insert(course);

    return "coursecreated";
  }

  @GetMapping("/courseregist")
  public String viewCourseRegist(
          @RequestParam("year") int year,
          @RequestParam("semester") int semester,
          Model model) {
    List<Course> courses = courseService.getCoursesByYearAndSemester(year, semester);
    model.addAttribute("courses", courses);

    return "courseregist"; // 상세 정보를 표시할 JSP 파일 이름
  }
}
