# XYTrack
用于统计埋点的封装库

## 题记
以前埋点要自定义一个类，然后每次都要继承，恩，太累了，于是，想了个偷懒的法子

## 简介

## 如何使用

####修改UIViewController+XYTrack
在xyt_viewDidLoad添加你的统计代码
``` objc
- (void)xyt_viewDidLoad{
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        ...your track code
    }
    
    [self xyt_viewDidLoad];
}
```

#### 修改UIControl+XYTrack
在xyt_sendAction添加你的统计代码

``` objc
- (void)xyt_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    ...your track code
}
```
### 结束，就这么简单粗暴
如果，你恰好也在天朝，移步[这里](http://www.jianshu.com/p/2481f57324c5)

## 设计思路


## Release Versions

* v1.0