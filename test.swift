// playground で作ったコードをコマンドラインで ...
// いまのところ UIKit が見つかりませんで failed
import UIKit

var str = "Hello, playground"
let size = CGSize(width: 200, height: 200)
let view:UIView = UIView(frame: CGRect(origin: CGPointZero, size: size))
view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)

UIGraphicsBeginImageContextWithOptions(size, false, 0)

let path = UIBezierPath()
path.moveToPoint(CGPointMake(50, 100))
path.addLineToPoint(CGPointMake(150, 100))
UIColor.orangeColor().setStroke()
path.stroke()

view.layer.contents = UIGraphicsGetImageFromCurrentImageContext().CGImage

UIGraphicsEndImageContext()

let preview = view
