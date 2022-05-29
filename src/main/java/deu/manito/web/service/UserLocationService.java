package deu.manito.web.service;


import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.repository.UserLocationRepository;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
* @package : deu.manito.web.service
* @name : UserLocationService.java
* @date : 2022-05-29 오전 4:11
* @author : Dong
**/
@Service
public class UserLocationService {

    private UserLocationRepository userLocationRepository;

    public UserLocationService(UserLocationRepository userLocationRepository) {
        this.userLocationRepository = userLocationRepository;
    }

    public UserLocationAuthDto authMobileLocation(UserLocationAuthDto dto){
        UserLocation userLocation = UserLocation.toEntity(dto);

        UserLocation result = userLocationRepository.save(userLocation);

        if(result == null) throw new IllegalArgumentException("유저 위치 인증 오류");

        return UserLocationAuthDto.createUserLocationAuthDto(result);
    }
    
    // 유저의 위치 정보를 DB에서 검색
    public UserLocationAuthDto authPcLocation(String nickname){
        UserLocation userLocation = userLocationRepository.findByNickname(nickname).orElse(null);
            
        // PC에서 값이 들어올 때까지 요청 할 것이므로 null이어도 그냥 리턴
        return !Objects.isNull(userLocation)
                ? UserLocationAuthDto.createUserLocationAuthDto(userLocation)
                : null;
    }
}
