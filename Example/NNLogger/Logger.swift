//
//  Logger.swift
//  NNLogger_Example
//
//  Created by Nang Nguyen on 3/31/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import NNLogger

public class Logger {
    
    // MARK: Public methods
    public class func verbose(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        sharedInstance.verbose(message, file, function, line)
    }
    
    public class func debug(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        sharedInstance.debug(message, file, function, line)
    }
    
    public class func info(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        sharedInstance.info(message, file, function, line)
    }
    
    public class func warning(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        sharedInstance.warning(message, file, function, line)
    }
    
    public class func error(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        sharedInstance.error(message, file, function, line)
    }
    
    // MARK: Private methods
    private static let sharedInstance = NNLogger()
}
