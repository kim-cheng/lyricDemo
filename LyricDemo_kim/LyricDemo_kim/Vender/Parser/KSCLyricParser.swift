//
//  KSCLyricParser.swift
//  KSC歌词解析器
//
//  Created by kim on 2022/10/16.
//

import Foundation


class KSCLyricParser {
    static func parse(_ data:String) -> Lyric {
        let result=Lyric()
        result.isAccurate=true
        
        result.datum=[]
        
        //拆分
        let strings = data.components(separatedBy: ";\n")
        
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
    //例如：karaoke.add('00:27.487', '00:32.068', '一时失志不免怨叹', '347,373,1077,320,344,386,638,1096')
    static func parserLine(_ data:String) -> LyricLine? {
        if data.hasPrefix("karaoke.add('") {
            //过滤了前面的元数据
            
            //创建结果对象
            let lyricLine = LyricLine()
            
            //移除字符串前面的karaoke.add('
            //移除字符串后面的');
            //newData=00:27.487', '00:32.068', '一时失志不免怨叹', '347,373,1077,320,344,386,638,1096
            let newData = data[13..<data.count-2]
            
            //使用', '拆分字符串
            let commnds = newData.components(separatedBy: "', '")
            
            //开始时间
            lyricLine.startTime = DateUtil.parseToInt(commnds[0])
            
            //结束时间
            lyricLine.endTime = DateUtil.parseToInt(commnds[1])
            
            //歌词
            lyricLine.data = commnds[2]
            
            //将歌词拆分为每一个字
            lyricLine.words = lyricLine.data.words()
            
            if lyricLine.data.starts(with: "[") {
                //英文

                //整行歌词
                lyricLine.data = lyricLine.words.joined(separator: "")
            }
            
            //每一个字的时间
            lyricLine.wordDurations = []
            
            let lyricTimeString = commnds[3]
            
            //使用,拆分
            let lyricTimeWords = lyricTimeString.components(separatedBy: ",")
            
            //将字符串时间转为int
            for item in lyricTimeWords {
                lyricLine.wordDurations!.append(Int(item)!)
            }
            
            return lyricLine
        }
        return nil
    }
}
