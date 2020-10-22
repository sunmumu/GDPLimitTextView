//  Created by sunmumu

#import <UIKit/UIKit.h>
#import "GDPLimitTextviewConstant.h"

@interface GDPLimitTextView : UIView

@property (nonatomic, strong) UITextView                        *textView;
@property (nonatomic, assign)   BOOL                            hiddenNumberTip;

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder limitNumber:(NSInteger)limitNumber textBlock:(StringBlock)textBlock;

@end
