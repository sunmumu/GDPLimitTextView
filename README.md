# GDPLimitTextView

TextView有占位符合字数限制和提示

> 注意: 本demo集成了masonry第三方框架, 下载本框架后,先执行下pod install命令. 才可以运行demo看效果

## Use
法一 cocopods引用
pod 'GDPLimitTextView'

法二 文件拖入项目中
1. 下载GDPLimitTextView框架,把GDPLimitTextView文件夹拷贝到项目中. 
2. 在控制器中#import "GDPLimitTextView.h".
3. 本框架依赖Masonry库做约束, 你的项目需要集成Masonry框架.

## 创建方法
```
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder limitNumber:(NSInteger)limitNumber textBlock:(StringBlock)textBlock;

```

## License

GDPHeadView is released under a MIT License. See LICENSE file for details.

