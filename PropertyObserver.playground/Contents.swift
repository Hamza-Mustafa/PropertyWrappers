// Property Wrappers
// A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property.
// it enables us to attach such behaviors and logic directly to our properties themselves
// it’s very common to have some kind of associated logic that gets triggered every time that a value is modified.

// For example, let’s say that we wanted to create a property wrapper that automatically capitalizes all String values that were assigned to it.

@propertyWrapper struct Capitalized {
    var wrappedValue : String {
        didSet {
            wrappedValue = wrappedValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}
struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// To define a property wrapper, you make a structure, enumeration, or class that defines a wrappedValue property. In the code below, the TwelveOrLess structure ensures that the value it wraps always contains a number less than or equal to 12. If you ask it to store a larger number, it stores 12 instead. Private, which ensures number is used only in the implementation of TwelveOrLess. Code that’s written anywhere else accesses the value using the getter and setter for wrappedValue, and can’t use number directly.

@propertyWrapper struct TwelveOrLess {
    private var number: Int
    init() {
        self.number = 0
    }
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 12)
        }
    }
}

struct Rectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = Rectangle()
print(rectangle.height)
// Print 0

rectangle.height = 10
print(rectangle.height)
// Print 10

rectangle.height = 24
print(rectangle.height)
// Print 12

// Trying to store 24 actually stores a value of 12 instead, because 24 is too large for the property setter’s rule.



















