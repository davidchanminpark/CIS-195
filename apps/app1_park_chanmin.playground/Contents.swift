import UIKit
/*
 Name: Chanmin Park
 Pennkey: ddpp
 App Number: 1
 Looking forward to creating an app with an idea I've had in mind and becoming more comfortable with the environment so I can create more apps in the future!
 */

// Exercise 1
let foo: Int = 42
var fooStr: String? = "\(foo)"

print("My number is \(fooStr!)")

if let numba = fooStr {
    print("My number is \(numba)")
}

let numba = fooStr ?? "nonexistent"
print("My number is \(numba)")

// Exercise 2
var sentenceChar: [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"]
var sentenceStr = String(sentenceChar)
sentenceStr.append("!")
print(sentenceStr)

var peopleDict: [String: Int] = ["Dad": 54, "Mom": 51, "Damin": 20]
dump(peopleDict)

var myInfo = ("Chanmin Park", "2021")
print(myInfo)

// Exercise 3
peopleDict.forEach { (name, age) in
    if (age < 21) {
        print("My friend \(name) is under 21")
    } else {
        print("My friend \(name) is not under 21")
    }
}

for index in 1...10 {
    print(index)
}

for char in sentenceChar {
    print(char)
}

// Exercise 4
func sumAndDiff(_ a: Int, _ b: Int) -> (Int, Int) {
    return (a + b, a - b)
}

typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using pennId: PennId) {
    print("Enrolled \(pennId) in \(course)")
}

let newCourse: String = "CIS 195"
let myPennId: Int = 26170147
enroll(in: newCourse, using: myPennId)

// Exercise 5 and 6
struct Rectangle {
    var width: Int
    var length: Int
    var area: Int {
        return width * length
    }
    var description: String? {
        didSet {
            if let desc = description {
                print(desc)
            }
        }
    }
}
var myRect = Rectangle(width: 100, length: 120)
myRect.description = "This is my rectangle."
print(myRect.area)

struct School {
    var schoolName: String
}

struct Major {
    var majorName: String
}

class Student {
    var name: String
    var school: School?
    var major: Major = Major(majorName: "undeclared")
    
    init(name: String, school: String, major: String) {
        self.name = name
        self.school = School(schoolName: school)
        self.major = Major(majorName: major)
    }
    
    init(name: String) {
        self.name = name
    }
}

var me = Student(name: "Chanmin Park", school: "UPenn", major: "ECON and CIS")
var babyQuaker = Student(name: "baby")
babyQuaker.major = Major(majorName: ["CIS", "ECON", "ANTH", "PPE", "PSCI"].randomElement()!)



