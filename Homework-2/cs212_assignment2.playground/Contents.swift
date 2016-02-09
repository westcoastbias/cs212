//import UIKit to use M_PI for π
import UIKit

/*Circle
Write a struct named Circle.
Give you circle a property named “radius” with the type double.
Use a property observer to insure that the radius has a minimum value of 0.
Create calculated properties for “area” and “circumference”.
Create an initializer that sets the radius to 0, and another initializer that accepts a single parameter named radius.*/

struct Circle {
    var radius: Double {
        didSet {
            if radius < 0 {
                radius = 0
            }
        }
    }
    
    var area: Double {
        return M_PI * radius * radius
    }
    
    var circumference: Double {
        return M_PI * radius * 2
    }
    
    init() {
        radius = 0
    }
    
    init(radius r: Double) {
        if r < 0 {
            radius = 0
        } else {
            radius = r
        }
    }
}

//test circles
var circle1 = Circle()

circle1

var circle2 = Circle(radius: 5)

circle2


/*CircleCollection
Write a class named CircleCollection.
It should have a private property of type [Circle].  An array of circles.
It should have a calculated property named “count” that returns the size of the circle array.
It should have a method named removeCirclesWithRadiiLargerThan(min: Double, butSmallerThan: Double). The method should remove any circles that have a radius larger than the minimum requirement, and smaller than the max requirement.*/

class CircleCollection {
    private var circles = [Circle]()
    
    var count: Int {
        return circles.count
    }
    
    //not required in the spec, but I used a method to add circles to my circles array for testing
    func addCircle (circle c: Circle) {
        circles.append(c)
    }
    
    func removeCirclesWithRadiiLargerThan(min: Double,  butSmallerThan max: Double) {
        for var i = 0; i < count; i++ {
            if circles[i].radius > min && circles[i].radius < max {
                circles.removeAtIndex(i)
            }
        }
    }
    
    init() {
        var circle = Circle()
        circles.append(circle)
        
    }
    
    init(circle: Circle) {
        circles.append(circle)
    }
}

//collection testing
var collection = CircleCollection(circle: circle1)

collection.circles

collection.addCircle(circle: circle2)

collection.count

collection.removeCirclesWithRadiiLargerThan(1, butSmallerThan: 10)

collection.count


/*ToDoItem
Write a class named ToDoItem, that might be used in an app that keeps a list tasks that the user wants to do.
Give the class a String property named “task”
Give the class a Int property named “priority”. Use an observer to insure that the value is in the range of  0 to 10.
Give the class an optional property named “dueDate”. It’s data type should be an NSDate optional.
Give the class an init method that accepts three arguments, one for each property
Give the class a method named fullDescription() that returns a string with the task, priority, and the due date if there is one. The format of this string is up to you. Anything that includes the information is file. You should conditionally unwrap the date, to form appropriate strings for items that have dates, and for items that do not.*/

class ToDoItem {
    var task: String
    var priority: Int {
        didSet {
            if priority < 0 {
                priority = 0
            } else if priority > 10 {
                priority = 10
            }
        }
    }
    
    var dueDate: NSDate?
    
    init(task t: String, priority p: Int, dueDate dd: NSDate?) {
        task = t
        if p < 0 {
            priority = 0
        } else if p > 10 {
            priority = 10
        } else {
            priority = p
        }
        dueDate = dd
    }
    
    init(task t: String, priority p: Int) {
        task = t
        if p < 0 {
            priority = 0
        } else if p > 10 {
            priority = 10
        } else {
            priority = p
        }
    }
    
    func fullDescription() -> String {
        if let dueDate = dueDate {
            return "Task: \(task), Priority: \(priority), Due: \(dueDate)"
        } else {
            return "Task: \(task), Priority: \(priority)"
        }
    }
}

//to do item testing
var item1 = ToDoItem(task: "Do homework", priority: 7, dueDate: NSDate())
var item2 = ToDoItem(task: "Go to class", priority: 13)

item1.fullDescription()
item2.fullDescription()


/*AnnotatedToDoItem
Write a class named AnnotatedToDoItem that is a subclass of ToDoItem, but adds an additional property.
The additional property should be named “note”, and it should be a String optional
Write an init method that accepts four arguments. The three in ToDoItem, and the additional note property.
Override the fullDescription method so that it includes the note if there is one.*/

class AnnotatedToDoItem: ToDoItem {
    var note: String?
    init(task t: String, priority p: Int, dueDate dd: NSDate?, note n: String?) {
        note = n
        super.init(task: t, priority: p, dueDate: dd)
    }
    
    init(task t: String, priority p: Int, note n: String?) {
        note = n
        super.init(task: t, priority: p)
    }
    
    override init(task t: String, priority p: Int) {
        super.init(task: t, priority: p)
    }
    
    override func fullDescription() -> String {
        if let note = note {
            return super.fullDescription() + " Note: \(note)"
        } else {
            return super.fullDescription()
        }
    }
}

//annotated to do item testing
var item3 = AnnotatedToDoItem(task: "Check this class", priority: 5, dueDate: NSDate(), note: "note note")

item3.fullDescription()

var item4 = AnnotatedToDoItem(task: "One more check", priority: 15)

item4.fullDescription()


