//
//  Helper.swift
//  ThuVienAnh
//
//  Created by cvcuong on 14/04/2023.
//

import Foundation
import Kingfisher
import UIKit
class Helper {
    public static let shared = Helper()
    func loadImageFromUrlWithKF(urlString: String?) -> UIImageView {
        let imageView = UIImageView()
        let url = URL(string: urlString ?? "")!
        imageView.kf.setImage(with: url)
        return imageView
    }
    func randomString(length: Int) -> String {
      let letters = "abcdef456ghijkJKLMNOlmno()pqrsDEFtuvwxyz!$#@/_*+-ABCGHIPQRSTUVWX&^%YZ0123789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
