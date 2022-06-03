package deu.manito.web.apiController;

import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.service.GradeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
public class GradeApiController {
    private GradeService gradeService;

    public GradeApiController(GradeService gradeService){ this.gradeService = gradeService; }

    @GetMapping("/api/rate")
    public ResponseEntity<GradeDto> rateGrade(@RequestBody GradeDto gradeDto){

        gradeDto = gradeService.rateGrade(gradeDto);

        if(Objects.isNull(gradeDto))
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        return ResponseEntity.status(HttpStatus.OK).body(gradeDto);
    }


}
