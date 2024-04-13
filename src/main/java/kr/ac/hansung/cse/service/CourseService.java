package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.CourseDao;
import kr.ac.hansung.cse.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

@Service
public class CourseService {

  @Autowired
  private CourseDao courseDao;

  public List<Course> getAllCourses() {
    return courseDao.getAllCourses();
  }

  // 각 Course 객체를 년도와 학기를 기준으로 그룹화
  // 각 그룹의 credit 값을 합산하여 맵에 저장
  // 키는 "년도 학기" 형태의 문자열, 값은 해당 그룹의 학점 총합.
  public Map<String, Integer> getCreditSummaryByYearAndSemester(List<Course> courses) {
    Map<String, Integer> creditSummary = courses.stream()
            .collect(Collectors.groupingBy(
                    course -> course.getYear() + " " + course.getSemester(),
                    Collectors.summingInt(Course::getCredit)
            ));
    // TreeMap을 사용하여 자동 정렬
    return new TreeMap<>(creditSummary);
  }

  public int getTotalCredits(List<Course> courses) {
    // 모든 학점의 총합을 구함
    return courses.stream()
            .mapToInt(Course::getCredit)
            .sum();
  }


  // 특정 연도와 학기의 과목 정보를 조회
  public List<Course> getCoursesByYearAndSemester(int year, int semester) {
    return courseDao.getCoursesByYearAndSemester(year, semester);
  }

  public void insert(Course course) {
    courseDao.insert(course);
  }
}
