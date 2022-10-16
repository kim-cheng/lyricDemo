//
//  LyricLine.swift
//  一行歌词模型
//  单位都是毫秒
//
//  Created by smile on 2022/7/11.
//

import Foundation

class LyricLine {
    /// 整行歌词
    var data:String!

    /// 开始时间
    var startTime:Int!

    /**
     * 每一个字
     */
    var words:Array<String>!

    /**
     * 每一个字对应的时间
     */
    var wordDurations:Array<Int>!
    
    /**
     * 结束时间
     */
    var endTime:Int=0
}
