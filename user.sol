pragma solidity ^0.4.21;

import "stringUtils.sol";

contract userRecords {
    enum genderType { male, female }
    struct user {
        string name;
        genderType gender;
    }
    
    user user_obj;

    function setUser(string name, string gender) public {
        genderType gender_type = getGenderFromString(gender);
        user_obj = user({name:name, gender:gender_type});
    }

    function getUser() public returns (string, string) {
        return (user_obj.name,
        getGenderToString(user_obj.gender));
    }

    function getGenderFromString(string gender) internal returns (genderType) {
        if (StringUtils.equal(gender, "male")) {
            return genderType.male;
        } else {
            return genderType.female;
        }
    }

    function getGenderToString(genderType gender) internal returns (string) {
        if (gender == genderType.male) {
            return "male";
        } else {
            return "female";
        }
    }
}