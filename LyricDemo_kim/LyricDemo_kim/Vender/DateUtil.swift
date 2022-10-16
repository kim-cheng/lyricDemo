//
//  DateUtil.swift
//  lyricDemo
//
//  Created by kim on 2022/10/16.
//

class DateUtil {
    /// 将分秒毫秒数据转为毫秒
    ///
    /// - Parameter data: 格式为：00:06.429
    /// - Returns: <#return value description#>
    static func parseToInt(_ data:String) -> Int {
        //将:替换.
        let value = data.replacingOccurrences(of: ":", with: ".")
        
        //使用.拆分
        let strings = value.components(separatedBy: ".")
        
        //分别取出分秒毫秒
        let m = Int(strings[0])!
        let s = Int(strings[1])!
        let ms = Int(strings[2])!
        
        //转为毫秒
        return (m*60+s) * 1000 + ms
    }
}
