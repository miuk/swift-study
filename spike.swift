// 2019/3/21, updated for swift4.2
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
// 引数はラベル必須
print(sampleFunc(arg:"引き数"))
print(sampleFunc(arg:123))
// 文字分解
for chr in "漢字変換" {
    print(chr)
}
// 部分文字列
print("最初の文字: \(sValue.prefix(1))")
print("最後の文字: \(sValue.suffix(1))")
for index in sValue.indices {
    print(" \(index) 番目の文字: \(sValue[index])")
}
////////////////////////////////////////////////////////////////////////
// 文字列操作
// 文字列の文字数（バイト数ではない）
var sLen = sValue.count
print("文字列 '\(sValue)' の文字数: \(sLen)")
var emptyStr = ""
print("isEmpy emptyStr: \(emptyStr.isEmpty)") // 空文字列判定
print(sValue.hasPrefix("文")) // 先頭一致検査
print(sValue.hasSuffix("列")) // 末尾一致検査
// 部分文字列。めんどくせー
var start:String.Index = sValue.startIndex
start = sValue.index(start, offsetBy: 0)
var end:String.Index = sValue.index(start, offsetBy: 2)
print(sValue[start...end])
print(sValue[start..<end])
// 大文字小文字変換
var lowerStr = "this is lowercase."
var upperStr = "THIS IS UPPERCASE."
print(lowerStr.uppercased())
print(upperStr.lowercased())
print("文字列の連結: " + lowerStr + upperStr)
// ! は optional 外し
print(Int("123")!)
// ?? は nil の場合の代替
print(Int("nonum") ?? 0)
var strvar = "元の文字列"
// 文字列の挿入
strvar.insert("!", at: strvar.index(strvar.startIndex, offsetBy: 2))
print(strvar)
// 文字列を末尾に追加
strvar.append(sValue)
print(strvar)
// 末尾の文字列削除
strvar.remove(at: strvar.index(before: strvar.endIndex))
print(strvar)
// 範囲指定削除
strvar.removeSubrange(strvar.index(strvar.endIndex, offsetBy: -3)..<strvar.endIndex)
print(strvar)
////////////////////////////////////////////////////////////////////////
// 配列
var arrStr: [String] = ["arg1", "arg2", "arg3"]
print(arrStr.count) // 要素数
arrStr += ["arg4"] // 末尾に追加
arrStr.append("arg5") // 末尾に追加
arrStr.insert("arg0", at:0) // 指定位置に挿入
for arg in arrStr {
    print(arg)
}
arrStr.removeLast() // 末尾削除
arrStr.remove(at: 0) // 指定位置削除
arrStr.removeSubrange(0..<1) // 範囲削除
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
print(dicX.updateValue(4, forKey: "key4")!) // 旧値取得して置換
dicX["key5"] = 5
dicX["key6"] = 6
dicX["key5"] = nil // 削除
print(dicX.removeValue(forKey: "key6")!) // 旧値取得して削除
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
var t1: (Int, String) = retTuple(code:404, phrase:"Not Found")
print(t1)
t1.0 = 410; t1.1 = "Gone"; print(t1) // index で要素アクセス
var t2: (code:Int, phrase:String) = (400, "Bad Request")
print(t2)
t2.code = 403; t2.phrase = "Forbidden"; print(t2) // ラベルで要素アクセス
