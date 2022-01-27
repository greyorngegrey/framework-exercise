import UIKit

public class RazeCore {
    
    /// Allows you to convert a 6-digit hexidecimal string to a UIColor instance
    /// - Parameters:
    ///   - hexString: A 6-digit hexidecimal string
    ///   - alpha: A number between 0 - 1.0 indicating how transparent the color is
    /// - Returns: A UIColor defined by the `HexString`parameter
    class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
      let r, g, b: CGFloat
      let offset = hexString.hasPrefix("#") ? 1 : 0
      let start = hexString.index(hexString.startIndex, offsetBy: offset)
      let hexColor = String(hexString[start...])
      let scanner = Scanner(string: hexColor)
      var hexNumber: UInt64 = 0
      if scanner.scanHexInt64(&hexNumber) {
        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x0000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
      }
      return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}