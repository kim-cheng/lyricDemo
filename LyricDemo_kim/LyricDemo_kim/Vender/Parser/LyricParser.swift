//
//  LyricParser.swift
//  歌词解析器
//
//  Created by kim on 2022/10/16.
//

import Foundation

class LyricParser {
    /// 解析歌词
    /// - Parameters:
    ///   - style: <#style description#>
    ///   - data: <#data description#>
    /// - Returns: <#description#>
    static func parse(_ style:Int,_ data:String) -> Lyric {
        switch style {
        case Style.KSC_Style.rawValue:
            return KSCLyricParser.parse(data)
        default:
            //默认解析LRC歌词
            return LRCLyricParser.parse(data)
        }
    }
}
