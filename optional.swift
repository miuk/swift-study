var o: Int? = nil
var o2: Optional<Int> = nil
// 上記 2 つは同じ意味
print(o)
o = 123
print(o!)
//print(o2!) // nill なのにunwarpすると死ぬ
