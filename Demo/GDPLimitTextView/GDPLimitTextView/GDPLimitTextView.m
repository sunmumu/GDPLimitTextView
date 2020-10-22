//  Created by sunmumu

#import "GDPLimitTextView.h"
#import <Masonry.h>
#import "GDPLimitTextviewConstant.h"

@interface GDPLimitTextView () <UITextViewDelegate>

@property (nonatomic, strong) UILabel                           *placeLabel;
@property (nonatomic, strong) UILabel                           *numberTipLabel;

@property (nonatomic, copy) NSString                            *placeholder;
@property (nonatomic, assign) NSInteger                         limitNumber;
@property (nonatomic, copy) StringBlock                         textBlock;

@end

@implementation GDPLimitTextView

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder limitNumber:(NSInteger)limitNumber textBlock:(StringBlock)textBlock {
    if (self = [super initWithFrame:frame]) {
        self.placeholder = placeholder;
        self.limitNumber = limitNumber;
        self.textBlock = textBlock;
        [self setupSubViews];
    }
    return self;
}

+ (instancetype)_alloc {
    return [super allocWithZone:NSDefaultMallocZone()];
}

- (instancetype)init {
    NSCAssert(NO, @"请使用`- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder limitNumber:(NSInteger)limitNumber`方法创建对象");
    return nil;
}

// MARK: - SetupUI
- (void)setupSubViews {
    self.backgroundColor = THEME_CONTANTCOLOR;
    [self addSubview:self.textView];
    [self addSubview:self.placeLabel];
    [self addSubview:self.numberTipLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.trailing.equalTo(self.mas_trailing).offset(-(0));
        make.bottom.equalTo(self.mas_bottom).offset(-(0));
    }];
    [self.placeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(THEME_MARGIN);
        make.top.equalTo(self.mas_top).offset(THEME_MAXMARGIN);
        make.trailing.equalTo(self.mas_trailing).offset(-(THEME_MARGIN));
        make.height.equalTo(@(20));
    }];
    [self.numberTipLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).offset(-(THEME_MARGIN));
        make.bottom.equalTo(self.mas_bottom).offset(-(THEME_MAXMARGIN));
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
}

// MARK: UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.placeLabel.hidden = YES;
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.placeLabel.hidden = NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    if (str.length > self.limitNumber) {
        NSRange rangeIndex = [str rangeOfComposedCharacterSequenceAtIndex:self.limitNumber];
        if (rangeIndex.length == 1) {
            //字数超限
            textView.text = [str substringToIndex:self.limitNumber];
            //这里重新统计下字数，字数超限，我发现就不走textViewDidChange方法了，你若不统计字数，忽略这行
            self.numberTipLabel.text = [NSString stringWithFormat:@"%lu/%ld",(unsigned long)textView.text.length, self.limitNumber];
        } else {
            NSRange rangeRange = [str rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.limitNumber)];
            textView.text = [str substringWithRange:rangeRange];
        }
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    NSString *string = [NSString stringWithFormat:@"%ld/%ld",textView.text.length,self.limitNumber];
    self.numberTipLabel.text = string;
    if (self.textBlock) {
        self.textBlock(textView.text);
    }
}

// MARK: - Setter -
- (void)setHiddenNumberTip:(BOOL)hiddenNumberTip {
    _hiddenNumberTip = hiddenNumberTip;
    self.numberTipLabel.hidden = hiddenNumberTip;
}

// MARK: - Getter -
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = THEME_WHITECOLOR;
        _textView.textContainerInset = UIEdgeInsetsMake(THEME_MAXMARGIN, THEME_MARGIN, THEME_MAXMARGIN, THEME_MARGIN);
        _textView.delegate = self;
    }
    return _textView;
}

- (UILabel *)placeLabel {
    if (!_placeLabel) {
        _placeLabel = [[UILabel alloc] init];
        _placeLabel.font = THEME_SECONDFONTSIZE;
        _placeLabel.text = self.placeholder;
        _placeLabel.textColor = THEME_THRIDTEXTCOLOR;
        _placeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _placeLabel;
}

- (UILabel *)numberTipLabel {
    if (!_numberTipLabel) {
        _numberTipLabel = [[UILabel alloc] init];
        _numberTipLabel.font = THEME_SECONDFONTSIZE;
        _numberTipLabel.text = [NSString stringWithFormat:@"0/%ld", self.limitNumber];
        _numberTipLabel.textColor = THEME_THRIDTEXTCOLOR;
        _numberTipLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numberTipLabel;
}

@end
