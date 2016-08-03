//
//  ViewController.m
//  UIDynamic
//
//  Created by HnLiee on 16/8/3.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
/** 物理仿真器 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end

@implementation ViewController

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        // 1.创建物理仿真器(ReferenceView 参照试图，其实就是设置仿真范围)
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (IBAction)gravity:(id)sender {
    // 删除旧的行为
    [self.animator removeAllBehaviors];
    
    // 2.创建物理仿真行为 - 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
    [gravity addItem:self.blueView];
    
    // 设置重力的方向
    gravity.gravityDirection = CGVectorMake(1, 1);
    // 设置重力加速度
    gravity.magnitude = 1; // 1 point/s²
    
    // 3.添加 物理仿真行为 到 仿真器 中，开始物理仿真
    [self.animator addBehavior:gravity];
}

- (IBAction)collision:(id)sender {
    // 删除旧的行为
    [self.animator removeAllBehaviors];
    
    // 2.创建物理仿真行为 - 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
    [collision addItem:self.blueView];
    [collision addItem:self.segmentControl];
    
    // 让参照视图的bounds变为碰撞的检测的边框
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 添加边界 ---> 线段
//    CGFloat startY = self.view.frame.size.height * 0.5;
//    CGFloat endX = self.view.frame.size.width;
//    CGFloat endY = self.view.frame.size.height;
//    [collision addBoundaryWithIdentifier:@"line1" fromPoint:CGPointMake(0, startY) toPoint:CGPointMake(endX, endY)];
//    [collision addBoundaryWithIdentifier:@"line2" fromPoint:CGPointMake(endX, 0) toPoint:CGPointMake(endX, endY)];
    
    // 添加边界 ---> 圆弧
//    CGFloat width = self.view.frame.size.width;
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width, width)];
//    [collision addBoundaryWithIdentifier:@"circle" forPath:path];
    
    // 创建物理仿真行为 - 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
    [gravity addItem:self.blueView];
    
    // 3.添加 物理仿真行为 到 仿真器 中，开始物理仿真
    [self.animator addBehavior:collision];
    [self.animator addBehavior:gravity];
}

- (IBAction)restore:(id)sender {
    self.blueView.frame = CGRectMake(20, 28, 100, 100);
    self.segmentControl.frame = CGRectMake(37, 299, 232, 29);
    
    // 删除旧的行为
    [self.animator removeAllBehaviors];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获得触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    // 创建 吸附/捕捉 行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.blueView snapToPoint:point];
    
    // 防抖系数(值越小，越抖)
    snap.damping = 0.5;
    
    // 删除旧的行为
    [self.animator removeAllBehaviors];
    
    // 添加行为
    [self.animator addBehavior:snap];
}

@end












