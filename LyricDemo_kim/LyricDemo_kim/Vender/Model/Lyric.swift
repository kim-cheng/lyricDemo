//
//  Lyric.swift
//  歌词模型
//
//  Created by smile on 2022/7/11.
//

import Foundation

class Lyric {
    /// 是否是精确到字的歌词
    var isAccurate:Bool = false
    
    /// 所有的歌词
    var datum:Array<LyricLine>!
}
