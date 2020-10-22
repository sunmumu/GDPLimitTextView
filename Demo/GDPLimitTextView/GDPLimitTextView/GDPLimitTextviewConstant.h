//  Created by sunmumu

#ifndef GDPLimitTextviewConstant_h
#define GDPLimitTextviewConstant_h

#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

// MARK: - UIColor
#define HEXCOLOR(rgbValue)                      [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define THEME_CONTANTCOLOR                      HEXCOLOR(0XFFFFFF)
#define THEME_WHITECOLOR                        HEXCOLOR(0XFFFFFF)

#define THEME_FIRSTTEXTCOLOR                    HEXCOLOR(0X333333)
#define THEME_SECONDTEXTYCOLOR                  HEXCOLOR(0X656565)
#define THEME_THRIDTEXTCOLOR                    HEXCOLOR(0XA0A0A0)
#define THEME_FOURTEXTCOLOR                     HEXCOLOR(0XB2B2B2)

// MARK: - FontSize
#define THEME_MAXFONTSIZE                       [UIFont systemFontOfSize:18]
#define THEME_FIRSTFONTSIZE                     [UIFont systemFontOfSize:16]
#define THEME_SECONDFONTSIZE                    [UIFont systemFontOfSize:14]
#define THEME_THRIDFONTSIZE                     [UIFont systemFontOfSize:12]
#define THEME_FOURFONTSIZE                      [UIFont systemFontOfSize:13]

// MARK: - MARGIN
#define THEME_MAXMARGIN                         20.0f
#define THEME_MARGIN                            16.0f
#define THEME_FIRSTMARGIN                       14.0f
#define THEME_SECONDMARGIN                      12.0f
#define THEME_THRIDMARGIN                       10.0f
#define THEME_FOURMARGIN                        7.0f
#define THEME_MINIMARGIN                        4.0f

#define THEME_TWENTYMARGIN                      20.0f
#define THEME_FIVEMARGIN                        5.0f

typedef void (^StringBlock)(NSString *result);

#endif /* GDPLimitTextviewConstant_h */
