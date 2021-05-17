//
//  ModuleA_IMPL.swift
//  ViuMiddlewareDemo
//
//  Created by JNWHYJ on 2021/5/17.
//

import Foundation
import UIKit

class ModuleA_IMPL: NSObject{
    
    deinit {
        TLog()
    }
    
    @objc public func showDetailPage(_ params:[AnyHashable:Any]) -> UIViewController{
        /// get callback block and called
        if let callback = params["callback"] as? (String) -> Void {
            callback("success - temp-details ")
        }
        
        let vc_ = DetailsViewController()
        return vc_
    }
}
