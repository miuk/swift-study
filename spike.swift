// 定数
let constInt:Int = 8
// 変数
var iValue:Int = 5
var dValue:Double = 9.5
var sValue:String = "文字列"
var bValue:Bool = true
// 文字列内変数展開
print("iValue=\(iValue), dValue=\(dValue), sValue=\(sValue), bValue=\(bValue)")
// 辞書
var hash = ["key1" : "value1", "key2" : "value2"]
for (key, value) in hash {
    print("key=\(key), value=\(value)")
}
// 関数
func sampleFunc(arg:String) -> String {
    let ret = "arg is " + arg
    return ret
}
func sampleFunc(arg:Int) -> String {
    let ret = "arg*2 is \(arg*2)"
    return ret
}
print(sampleFunc("引き数"))
print(sampleFunc(123))
// 文字分解
for chr in "漢字変換".characters {
    print(chr)
}
// 直接数値でインデクシングできない
print("最初の文字: \(sValue[sValue.startIndex])")
print("次の文字: \(sValue[sValue.startIndex.advancedBy(1)])")
for index in sValue.characters.indices {
    print(" \(index) 番目の文字: \(sValue[index])")
}
////////////////////////////////////////////////////////////////////////
// 文字列操作
// 文字列の文字数（バイト数ではない）
var sLen = sValue.characters.count
print(sLen)
var emptyStr = ""
print("isEmpy emptyStr: \(emptyStr.isEmpty)") // 空文字列判定
print(sValue.hasPrefix("文")) // 先頭一致検査
print(sValue.hasSuffix("列")) // 末尾一致検査
// 部分文字列。めんどくせー
print(sValue[Range(start: sValue.startIndex.advancedBy(0),
                   end: sValue.startIndex.advancedBy(2))])
// 大文字小文字変換
var lowerStr = "this is lowercase."
var upperStr = "THIS IS UPPERCASE."
print(lowerStr.uppercaseString)
print(upperStr.lowercaseString)
print("文字列の連結: " + lowerStr + upperStr)
// ! は optional 外し
print(Int("123"))
// ?? は nil の場合の代替
print(Int("nonum") ?? 0)
var strvar = "元の文字列"
strvar.insert("!", atIndex: strvar.endIndex)
print(strvar)
// 文字列を直接挿入できない
strvar.insertContentsOf(sValue.characters, at: strvar.endIndex.predecessor())
print(strvar)
strvar.removeAtIndex(strvar.endIndex.predecessor())
print(strvar)
strvar.removeRange(strvar.endIndex.advancedBy(-3)..<strvar.endIndex)
print(strvar)
////////////////////////////////////////////////////////////////////////
// 配列
var arrStr: [String] = ["arg1", "arg2", "arg3"]
print(arrStr.count) // 要素数
arrStr += ["arg4"] // 末尾に追加
arrStr.append("arg5") // 末尾に追加
arrStr.insert("args0", atIndex:0) // 指定位置に挿入
for arg in arrStr {
    print(arg)
}
arrStr.removeLast() // 末尾削除
arrStr.removeAtIndex(0) // 指定位置削除
arrStr.removeAll() // 全削除
print(arrStr.isEmpty) // 空調査
var arrAny: [Any] = [1, "arg2", 3.0] // 複合配列
for arg in arrAny {
    print(arg)
}
////////////////////////////////////////////////////////////////////////
// 辞書
var dicX: [String: Int] = ["key1": 1, "key2": 2, "key3": 3]
dicX["key4"] = 4
dicX["key4"] = 5
print(dicX.updateValue(4, forKey: "key4")) // 旧値取得して置換
dicX["key5"] = 5
dicX["key6"] = 6
dicX["key5"] = nil // 削除
print(dicX.removeValueForKey("key6")) // 旧値取得して削除
print(dicX["keyX"]) // 存在しない場合は nil
for (key, val) in dicX {
    print("key=\(key), val=\(val)")
}
print("dicX=\(dicX)") // 展開可能
print("dicX.key=\(Array(dicX.keys))") // 配列として扱うには Array() でくるむ
for key in dicX.keys { print(key) } // 参照渡しっぽい
for val in dicX.values { print(val) }
// 辞書は参照ではない
var dicY = dicX
dicY["key3"] = -1
print(dicX["key3"])
print(dicY["key3"])
////////////////////////////////////////////////////////////////////////
// Range
for i in 1...3 { print(i, terminator: "") }; print("") // 3 を含む
for i in 1..<3 { print(i, terminator: "") }; print("") // 3 を含まない
////////////////////////////////////////////////////////////////////////
// Tuple
func retTuple(code:Int, phrase:String) -> (Int, String) {
    return (code, phrase)
}
var t1: (Int, String) = retTuple(404, phrase:"Not Found")
print(t1)
t1.0 = 410; t1.1 = "Gone"; print(t1) // index で要素アクセス
var t2: (code:Int, phrase:String) = (400, "Bad Request")
print(t2)
t2.code = 403; t2.phrase = "Forbidden"; print(t2) // ラベルで要素アクセス
////////////////////////////////////////////////////////////////////////
// 使えなくなった演算子等
// === はクラスのインスタンス同士の比較しかできなくなった
