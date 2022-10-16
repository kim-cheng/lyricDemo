//
//  LRCLyricParser.swift
//  LRC歌词解析器
//
//  Created by kim on 2022/10/16.
//

import Foundation

class LRCLyricParser {
    static func parse(_ data:String) -> Lyric {
        let result=Lyric()
        result.isAccurate=false
        
        result.datum=[]
        
        //\n拆分
        let strings = data.components(separatedBy: "\n")
        var lyricLine:LyricLine?=nil
        for line in strings {
            lyricLine = parserLine(line)
            
            if let r = lyricLine {
                result.datum.append(r)
            }
        }
        
        return result
    }
    
    //解析每一行歌词
    //例如：[00:00.300]爱的代价 - 李宗盛
    static func parserLine(_ data:String) -> LyricLine? {
        if data.starts(with: "[0") {
            //歌词开始，过滤了前面的元数据
            
            //创建一个LyricLine
            let lyricLine = LyricLine()
            
            //移除开始位置[字符串
            let data = data.substring(fromIndex: 1) //00:00.300]爱的代价 - 李宗盛
            
            //使用]拆分
            let commands = data.components(separatedBy: "]") //00:00.300,爱的代价 - 李宗盛
            
            //开始时间
            lyricLine.startTime = DateUtil.parseToInt(commands[0])
            
            //歌词
            lyricLine.data = commands[1]
            
            return lyricLine
        }
        
        return nil
    }
}
