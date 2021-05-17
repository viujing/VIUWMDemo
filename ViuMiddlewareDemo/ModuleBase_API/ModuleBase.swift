//
//  ModuleBase.swift
//  ViuMiddlewareDemo
//
//  Created by JNWHYJ on 2021/5/17.
//

import Foundation
import UIKit
/// swift module name for current target
public let SMName = "ViuMiddlewareDemo"

extension NSObject{
    /// Debug log
    public func TLog(_ message: String = "", file: String = #file, function: String = #function, line: Int = #line ) {
        #if DEBUG
        print("--Viu-> \(message) called from \(function) \(file):\(line)")
        #endif
    }
    
}
extension UIViewController{
    public func isTesting() -> Bool{
        return true
    }
    ///获取当前显示的控制器 UIWindow (Visible)
    public func topViewController() -> UIViewController {
        let keywindow = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController
        return getVisibleViewControllerFrom(vc: keywindow!)
    }
    ///
    public func getVisibleViewControllerFrom(vc: UIViewController) -> UIViewController {
        if let tabBarController = vc as? UITabBarController {
            return getVisibleViewControllerFrom(vc: tabBarController.selectedViewController!)
        }
        if let navigationController = vc as? UINavigationController {
            return getVisibleViewControllerFrom(vc: navigationController.visibleViewController!)
        }
        if vc.presentedViewController != nil {
            return getVisibleViewControllerFrom(vc: vc.presentedViewController!)
        }
        return vc
    }
    
}
