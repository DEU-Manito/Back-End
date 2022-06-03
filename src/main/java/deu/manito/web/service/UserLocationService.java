package deu.manito.web.service;


import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.dto.user.UserLocationDto;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.repository.UserLocationRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
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

        if(Objects.isNull(result)) throw new IllegalArgumentException("유저 위치 인증 오류");

        return UserLocationAuthDto.createUserLocationAuthDto(result);
    }
    
    // 유저의 위치 정보를 DB에서 검색
    public UserLocationAuthDto authPcLocation(String nickname){
        UserLocation userLocation = userLocationRepository.findByNickname(nickname).orElse(null);
            
        // PC에서 값이 들어올 때까지 요청 할 것이므로 예외를 던지지 않고 null 리턴
        return !Objects.isNull(userLocation)
                ? UserLocationAuthDto.createUserLocationAuthDto(userLocation)
                : null;
    }

    @Transactional
    public UserLocationAuthDto removeLocation(String nickname){
        UserLocation result = userLocationRepository.findByNickname(nickname)
                                                    .orElse(null);

        userLocationRepository.deleteByNickname(nickname);

        return Objects.isNull(result)
                ? null
                : UserLocationAuthDto.createUserLocationAuthDto(result);
    }
}
