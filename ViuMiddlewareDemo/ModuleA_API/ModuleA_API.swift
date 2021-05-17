//
//  ModuleA_API.swift
//  ViuMiddlewareDemo
//
//  Created by JNWHYJ on 2021/5/17.
//

import Foundation
import UIKit

extension ViuMiddleware {
    
    /// api actions
    public func showDetailPage(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kSwiftTargetModuleName:SMName,
        ] as [AnyHashable : Any]
        
        if let viewController = self.performTarget("ModuleA_IMPL",
                                                   action: "showDetailPage:",
                                                   params: params,
                                                   shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}
