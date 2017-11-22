package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.User;
import org.cloud.ssm.dto.UserDto;

public interface IUserService {

    List<User> getAllUsers(UserDto userDto);

    int getUserCount(UserDto userDto);
    
    User getUserByUserId(String userId);
}
