//  Created by sunmumu

#import <UIKit/UIKit.h>

@interface GDPLimitTextView : UIView

@property (nonatomic, strong) UITextView                        *textView;

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder limitNumber:(NSInteger)limitNumber;

@end
