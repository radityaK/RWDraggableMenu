//
//  RWDraggableMenu.m
//  DemoDraggable
//
//  Created by Raditya on 3/11/16.
//  Copyright © 2016 Raditya Kurnianto. All rights reserved.
//

#import "RWDraggableMenu.h"

@implementation RWDraggableMenu
- (UIView *)setupDragMenuInView:(UIView *)view width:(CGFloat)width height:(CGFloat)height backgroundColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha icons:(NSArray *)icons {
    if (!self.dragView) {
        // Setup property
        self.parentView = view;
        self.dragViewWidth = width;
        self.dragViewHeight = height;
        self.redColor = red;
        self.greenColor = green;
        self.blueColor = blue;
        self.defaultOpacity = alpha;
        self.alphaOpacity = self.defaultOpacity + 0.3;
        
        // setup drag view
        self.dragView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame) - width,  CGRectGetMidY(view.frame), width, height)];
        self.dragView.backgroundColor = [UIColor colorWithRed:self.redColor green:self.greenColor blue:self.blueColor alpha:self.defaultOpacity];
        self.dragView.layer.cornerRadius = self.dragView.frame.size.width / 2;
        self.dragView.clipsToBounds = YES;
        self.dragState = DragMenuClose;
        
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(detectPan:)];
        [self.dragView addGestureRecognizer:self.panGesture];
        
        // setup parent menu button
        self.parentButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.dragView.frame.size.width, self.dragView.frame.size.height)];
        [self.parentButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [icons objectAtIndex:0]]] forState:UIControlStateNormal];
        self.parentButton.center = CGPointMake(CGRectGetMidX(self.dragView.bounds), CGRectGetMidY(self.dragView.bounds));
        [self.parentButton addTarget:self action:@selector(tapParentMenu) forControlEvents:UIControlEventTouchUpInside];
        [self.dragView addSubview:self.parentButton];
        
        // 1
        self.subMenuButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width - 20, height - 20)];
        [self.subMenuButton1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [icons objectAtIndex:1]]] forState:UIControlStateNormal];
        self.subMenuButton1.tag = 1;
        [self.subMenuButton1 addTarget:self action:@selector(tapSubMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.dragView addSubview:self.subMenuButton1];
        
        // 2
        self.subMenuButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width - 20, height - 20)];
        [self.subMenuButton2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [icons objectAtIndex:2]]] forState:UIControlStateNormal];
        self.subMenuButton2.tag = 2;
        [self.subMenuButton2 addTarget:self action:@selector(tapSubMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.dragView addSubview:self.subMenuButton2];
        
        // 3
        self.subMenuButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width - 20, height - 20)];
        [self.subMenuButton3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [icons objectAtIndex:3]]] forState:UIControlStateNormal];
        self.subMenuButton3.tag = 3;
        [self.subMenuButton3 addTarget:self action:@selector(tapSubMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.dragView addSubview:self.subMenuButton3];
        
        // 4
        self.subMenuButton4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width - 20, height - 20)];
        [self.subMenuButton4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [icons objectAtIndex:4]]] forState:UIControlStateNormal];
        self.subMenuButton4.tag = 4;
        [self.subMenuButton4 addTarget:self action:@selector(tapSubMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.dragView addSubview:self.subMenuButton4];
    }
    
    [self hideMenuDrag];
    self.lastViewLocation = self.dragView.center;
    self.dragViewTranslation = self.lastViewLocation;
    
    return self.dragView;
}

# pragma mark Gesture
- (void)detectPan:(UIGestureRecognizer *)gesture {
    CGPoint translation = [gesture locationInView:self.parentView];
    self.dragViewTranslation = translation;
    
    self.dragView.center = translation;
    self.lastViewLocation = self.dragView.center;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.dragView.backgroundColor = [UIColor colorWithRed:self.redColor green:self.greenColor blue:self.blueColor alpha:self.alphaOpacity];
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self gestureEnd];
    }
}

- (void)gestureEnd {
    CGPoint midScreenOffset = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    
    CGFloat yPos = 0.0;
    if (self.dragViewTranslation.y < 0) {
        yPos = 0;
    } else if (self.dragViewTranslation.y > CGRectGetMaxY(self.parentView.bounds) - self.dragView.frame.size.height) {
        yPos = CGRectGetMaxY(self.parentView.bounds) - self.dragView.frame.size.height;
    } else {
        yPos = self.dragViewTranslation.y;
    }
    
    if (self.lastViewLocation.x > midScreenOffset.x) {
        NSLog(@"geser kanan");
        [UIView animateWithDuration:0.3 animations:^{
            self.dragView.frame = CGRectMake(CGRectGetWidth(self.parentView.frame) - self.dragViewWidth, yPos, self.dragViewWidth, self.dragViewHeight);
        }];
        self.lastViewLocation = self.dragView.center;
    } else {
        NSLog(@"geser kiri");
        [UIView animateWithDuration:0.3 animations:^{
            self.dragView.frame = CGRectMake(0, yPos, self.dragViewWidth, self.dragViewHeight);
        }];
        self.lastViewLocation = self.dragView.center;
    }
    
    self.dragViewTranslation = self.lastViewLocation;
    self.dragView.backgroundColor = [UIColor colorWithRed:self.redColor green:self.greenColor blue:self.blueColor alpha:self.defaultOpacity];
    NSLog(@"end");
}

# pragma mark Selector Parent Button
- (void)tapParentMenu {
    if (self.dragState == DragMenuClose) {
        CGPoint midScreen = CGPointMake(CGRectGetMidX(self.parentView.bounds), CGRectGetMidY(self.parentView.bounds));
        
        self.parentButton.hidden = YES;
        self.dragView.backgroundColor = [UIColor colorWithRed:self.redColor green:self.greenColor blue:self.blueColor alpha:self.alphaOpacity];
        
        self.hoverButton = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.hoverButton addTarget:self action:@selector(dismissMenu) forControlEvents:UIControlEventTouchUpInside];
        [self.parentView addSubview:self.hoverButton];
        [self.parentView bringSubviewToFront:self.dragView];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.dragView.frame = CGRectMake(0, 0, 250, 250);
            self.dragView.center = midScreen;
            self.dragState = DragMenuOpen;
            
            CGPoint midDragViewScreen = CGPointMake(CGRectGetMidX(self.dragView.bounds), CGRectGetMidY(self.dragView.bounds));
            
            [self showMenuDrag];
            self.subMenuButton1.center = CGPointMake(midDragViewScreen.x / 2, midDragViewScreen.y / 2);
            self.subMenuButton2.center = CGPointMake((midDragViewScreen.x + (midDragViewScreen.x / 2)), midDragViewScreen.y / 2);
            self.subMenuButton3.center = CGPointMake(midDragViewScreen.x / 2, (midDragViewScreen.y + (midDragViewScreen.y / 2)));
            self.subMenuButton4.center = CGPointMake((midDragViewScreen.x + (midDragViewScreen.x / 2)), (midDragViewScreen.y + (midDragViewScreen.y / 2)));
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            self.dragView.center = midScreen;
        }];
    }
    NSLog(@"tapParentMenu");
}

# pragma mark Selector Submenu Button
- (void)tapSubMenuButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(RWSubMenuTapAtIndex:)]) {
        UIButton *button = (UIButton *)sender;
        [self dismissMenu];
        [self.delegate RWSubMenuTapAtIndex:button.tag];
    }
}

# pragma mark Selector Dismiss Button
- (void)dismissMenu {
    if (self.dragState == DragMenuOpen) {
        [self hideMenuDrag];
        
        CGFloat yPos = 0.0;
        if (self.dragViewTranslation.y < 0) {
            yPos = 0;
        } else {
            yPos = self.dragViewTranslation.y - 35.0;
        }
        
        CGPoint midScreenOffset = CGPointMake(CGRectGetMidX(self.parentView.frame), CGRectGetMidY(self.parentView.frame));
        if (self.lastViewLocation.x > midScreenOffset.x) {
            [UIView animateWithDuration:0.3 animations:^{
                self.parentButton.hidden = NO;
                self.dragView.frame = CGRectMake(CGRectGetWidth(self.parentView.frame) - self.dragViewWidth, yPos, self.dragViewWidth, self.dragViewHeight);
                self.dragState = DragMenuClose;
                [self.hoverButton removeFromSuperview];
                self.hoverButton = nil;
            }];
        } else {
            [UIView animateWithDuration:0.3 animations:^{
                self.parentButton.hidden = NO;
                self.dragView.frame = CGRectMake(0, yPos, self.dragViewWidth, self.dragViewHeight);
                self.dragState = DragMenuClose;
                [self.hoverButton removeFromSuperview];
                self.hoverButton = nil;
            }];
        }
        self.dragView.backgroundColor = [UIColor colorWithRed:self.redColor green:self.greenColor blue:self.blueColor alpha:self.defaultOpacity];
    }
}

# pragma mark Utility
- (void)hideMenuDrag {
    self.subMenuButton1.hidden = YES;
    self.subMenuButton2.hidden = YES;
    self.subMenuButton3.hidden = YES;
    self.subMenuButton4.hidden = YES;
    self.panGesture.enabled = YES;
}

- (void)showMenuDrag {
    self.subMenuButton1.hidden = NO;
    self.subMenuButton2.hidden = NO;
    self.subMenuButton3.hidden = NO;
    self.subMenuButton4.hidden = NO;
    self.panGesture.enabled = NO;
}
@end
