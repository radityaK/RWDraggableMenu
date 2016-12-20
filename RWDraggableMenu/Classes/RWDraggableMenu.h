//
//  RWDraggableMenu.h
//  DemoDraggable
//
//  Created by Raditya on 3/11/16.
//  Copyright © 2016 Raditya Kurnianto. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DragMenuState) {
    DragMenuOpen = 0,
    DragMenuClose
};

@protocol RWDraggableMenuDelegate <NSObject>

@optional
- (void)onParentMenuTap;

@required
- (void)RWSubMenuTapAtIndex:(NSInteger)index;

@end

@interface RWDraggableMenu : UIView
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) UIView *parentView;
@property (strong, nonatomic) UIView *dragView;
@property (strong, nonatomic) UIButton *hoverButton;
@property (strong, nonatomic) UIButton *parentButton;
@property (strong, nonatomic) UIButton *subMenuButton1;
@property (strong, nonatomic) UIButton *subMenuButton2;
@property (strong, nonatomic) UIButton *subMenuButton3;
@property (strong, nonatomic) UIButton *subMenuButton4;
@property (readwrite, nonatomic) id<RWDraggableMenuDelegate> delegate;
@property (nonatomic) CGFloat dragViewWidth;
@property (nonatomic) CGFloat dragViewHeight;
@property (nonatomic) CGPoint lastViewLocation;
@property (nonatomic) CGPoint dragViewTranslation;
@property (nonatomic) CGFloat redColor;
@property (nonatomic) CGFloat greenColor;
@property (nonatomic) CGFloat blueColor;
@property (nonatomic) CGFloat defaultOpacity;

@property (nonatomic) CGFloat alphaOpacity;
@property (nonatomic) DragMenuState dragState;

- (UIView *)setupDragMenuInView:(UIView *)view width:(CGFloat)width height:(CGFloat)height backgroundColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha icons:(NSArray *)icons;
@end
