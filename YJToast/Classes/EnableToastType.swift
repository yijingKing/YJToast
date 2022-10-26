//
//  EnableToastType.swift
//  YJToast
//
//  Created by 祎 on 2022/10/26.
//

import UIKit
import SnapKit

public protocol EnableToastType {
    var targetView: UIView { get }
}

extension EnableToastType {
    public var toast: YJToast {
        return YJToast(targetView: targetView)
    }
}

extension UIViewController: EnableToastType {
    public var targetView: UIView {
        return view
    }
}

extension UIView: EnableToastType {
    public var targetView: UIView {
        return self
    }
}

