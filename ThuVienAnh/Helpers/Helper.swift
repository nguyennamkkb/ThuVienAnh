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
    func loadImageFromUrlWithKF(urlString: String?) -> UIImageView {
        let imageView = UIImageView()
        let url = URL(string: urlString ?? "")!
        imageView.kf.setImage(with: url)
        return imageView
    }
}
