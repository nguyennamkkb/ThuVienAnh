//
//  Extensions.swift
//  ThuVienAnh
//
//  Created by cvcuong on 14/04/2023.
//

import Foundation
import UIKit

typealias ClosureAction = ()->Void
typealias ClosureComplet = (Bool)->Void
typealias ClosureCustom<T> = ((_ item: T) -> Void)
extension Array {
    //lay item tai vi tri chack nil
    func itemAtIndex(index: Int) ->Element? {
        if self.count > index, index >= 0 {
            return self[index]
        }else {
            return nil
        }
    }
}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                hexColor.append("ff")
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

extension UserDefaults {

    static func exists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

}
extension UIWindow {
    
    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .curveEaseIn,
                                  completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
}

extension Date {
    var milliseconds: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

//String
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func prepareForSearch(_ shouldRemoveWhiteSpace: Bool = true) -> String {
        var newStr = self.folding(options: .diacriticInsensitive, locale: Locale.current)
        
        newStr = newStr.lowercased()
        
        newStr = newStr.replacingOccurrences(of: "đ", with: "d", options: NSString.CompareOptions.literal, range: nil)
        if shouldRemoveWhiteSpace {
            newStr = newStr.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
        }
        
        return newStr
    }
    
    func split(_ charactor: String) -> [String] {
        return self.split(whereSeparator: {String($0) == charactor}).map(String.init)
    }
}


//thread
extension Thread {
    class func runOnMain(block: @escaping (() -> Void)){
        if Thread.isMainThread == false {
            DispatchQueue.main.async(execute: {
                block()
            })
        }else{
            block()
        }
    }
    
    class func runOnMain(after: TimeInterval,block: @escaping (() -> Void)){
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            block()
        }
    }
    
    class func runOnBackground(block: @escaping (() -> Void)){
        if Thread.isMainThread == true {
            DispatchQueue(label: "QueueIdentification", qos: .background).async(execute: {
                block()
            })
        }else{
            block()
        }
    }
    
}
extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
