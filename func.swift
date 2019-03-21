// 2019/3/21, updated for swift4.2
func test(dB: Int, _ amp: Int) -> Int {
    return dB * amp
}
// 関数は定数とか変数に代入可能
var myFunc: (Int,Int)->Int = test
print(test(dB: 10, 20))
print(myFunc(10, 20))

func extname(dB d: Int, amp a: Int) -> Int { // 外部引数名
    return d * a
}
print(extname(dB: 10, amp: 20))
func extname2(dB: Int, amp: Int) -> Int { // 外部引数名を同名にする
    return dB * amp
}
print(extname(dB: 10, amp: 20))

func nested(dB: Int, amp: Int) -> Int {
    func mypow(dB: Int) -> Int { // ネスト関数
        var b: Int = 1
        for _ in 1..<dB {
          b *= 10
        }
        return b
    }
    return mypow(dB: dB) * amp
}
print(nested(dB: 3, amp: 20))

func sum(first: Int, _ rest: Int...) -> Int { // 可変長引数
    var total = first
    for num in rest { // rest は配列として扱える
        total += num
    }
    return total
}
print(sum(first: 1,2,3,4,5,6,7,8,9,10))

func sayHello(name: String = "world") { // デフォルト引数
    print("Hello, \(name)!")
}
sayHello()
sayHello(name: "John")

func swap(a: inout Int, b: inout Int) { // 参照渡し
    let tmp = a
    a = b
    b = tmp
}
var x = 1
var y = 2
print(x, y)
swap(&x, &y)
print(x, y)
