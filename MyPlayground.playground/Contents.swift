//: Playground - noun: a place where people can play

import UIKit

func checkRocky (array: Array<String>) -> String {
    for _number in 0 ... array.count - 1 {
        if (array[_number] == "Rocky") {
            return "Oir " + String(_number);
        }
    }
    return "";
}

print(checkRocky(array: ["Rocky", "Rockyinho"]));
print(checkRocky(array: ["Olaar", "Rockyinho", "Rocky"]));

class User {
    var name = "";
    var age = 0;
    var isFun = true
}

for i in 0 ... 5 {
    let user = User();
    user.name = "name " + String (i);
    user.age = i;
    user.isFun = false;
    print(user.name);
}
