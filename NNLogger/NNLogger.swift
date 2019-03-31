//
//  NNLogger.swift
//
//  Created by Nang Nguyen on 3/31/19.
//

import Foundation
import SwiftyBeaver

public class NNLogger {
    
    private let context: String
    
    public init( _ context: String = "APP") {
        self.context = context
        
        var consoleDestinationAlreadyExists = false
        for destination in SwiftyBeaver.destinations {
            if let consoleDest = destination as? ConsoleDestination {
                consoleDestinationAlreadyExists = true
                configureDestination(consoleDest)
            }
        }
        
        if !consoleDestinationAlreadyExists {
            let consoleDest = ConsoleDestination()
            configureDestination(consoleDest)
            SwiftyBeaver.addDestination(consoleDest)
        }
    }
    
    //MARK: Public logging methods
    
    public func verbose(_ message: String?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        SwiftyBeaver.verbose(formatMessage(message),file,function,line: line)
    }
    
    public func debug(_ message: String?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        SwiftyBeaver.debug(formatMessage(message),file,function,line: line)
    }
    
    public func info(_ message: String?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        SwiftyBeaver.info(formatMessage(message),file,function,line: line)
    }
    
    public func warning(_ message: String?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        SwiftyBeaver.warning(formatMessage(message),file,function,line: line)
    }
    
    public func error(_ message: String?, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        SwiftyBeaver.error(formatMessage(message),file,function,line: line)
    }
    
    
    //MARK: Private
    
    private func formatMessage( _ message: String?) -> String {
        let c = self.context
        if let m = message {
            return "[\(c)] \(m)"
        } else {
            return ""
        }
    }
    
    private func configureDestination( _ consoleDest: ConsoleDestination) {
        consoleDest.format = "[$Dyyyy-MM-dd HH:mm:ss$d] |$T| $N.$F:$l $C [$L$c] - $M"
        consoleDest.levelColor.verbose = "💭"
        consoleDest.levelColor.debug = "✅"
        consoleDest.levelColor.info = "ℹ️"
        consoleDest.levelColor.warning = "⚠️"
        consoleDest.levelColor.error = "🚫"
        
        #if DEBUG
        consoleDest.minLevel = .verbose
        consoleDest.asynchronously = false
        #else
        consoleDest.minLevel = .info
        consoleDest.asynchronously = true
        #endif
    }
}
