class Parent {
    var name: String;
    init(name: String) {
        self.name = name
    }
}

var p: Parent = Parent(name: "smith");
var q = p;
print("\(p===q)");
