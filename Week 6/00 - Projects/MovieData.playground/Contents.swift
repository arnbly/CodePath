//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//print(str)
let integers: [Int] = [1,2,3,4,5,6]

let firstItem = integers[0]
let thirdItem = integers[2]
let anotherFirstItem = integers.first
let lastInt = integers.last
let numberOfInts = integers.count

for integer in integers {
    //print(integer)
}

var colors = ["red","blue","green","yellow"]

for (index, color) in colors.enumerated() {
    //print("the color \(color) is at index \(index)")
}

colors[1] = "purple"
colors
let removedColor = colors.remove(at: 2)
colors
removedColor


//Dictionaries 
let movie1 = ["title": "Waynes World", "overview": "Not Bill and Ted's excellent adventure"]
let movie2 = ["overview": "Maverik and Goose try to outfly Iceman", "title": "Top Gun"]
let movie3 = ["overview": "As you wish, Buttercup", "title": "The Princess Bride"]

let movies = [movie1, movie2, movie3]

for movie in movies {
    //print("In \(movie["title"]!), \(movie["overview"]!)")
}

let response: [String : Any] = ["dates": "asdfasdf", "pages": "asdfasdf", "results": movies]

let myFavMovie = response["results"] as! [NSDictionary]
let secondMovie = myFavMovie[1]
let title = secondMovie["title"]!

print(title)




