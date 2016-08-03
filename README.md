# UIDynamic

模拟和仿真现实生活中的物理现象，如：重力、碰撞、捕捉、推动、附着、动力元素等

详情请参考 UIDynamic.pptx

## 简介 

##### 什么是UIDynamic


1. UIDynamic是从ios7开始引入的一种新技术，隶属于UIKit框架
2. 可以认为是一种物理引擎，能模拟和仿真现实生活中的物理现象
3. 重力、弹性碰撞等现象

##### 物理引擎的价值

1. 广泛应用于游戏开发，例如：愤怒的小鸟
2. 让开发人员远离物理学公式的情况下，实现炫酷的物理仿真效果
3. 提高了游戏开发效率，产生更多优秀好玩的物理仿真游戏

##### 知名的2D物理引擎

1. Box2D
2. chipmunk

## 使用步骤
##### 使用UIDynamic实现物理仿真效果的大致步骤如下：

1. 创建一个物理仿真器（顺便设置仿真范围）
2. 创建相应的物理仿真行为（顺便添加物理仿真元素）
3. 将物理仿真行为添加到物理仿真器中 ---> 开始仿真

## 物理仿真行为
##### 此处demo介绍了前三种行为，后面的行为和前面的差不多

1. UIGravityBehavior : 重力行为
2. UICollisionBehavior : 碰撞行为
3. UISnapBehavior : 捕捉行为
4. UIPushBehavior : 推动行为
5. UIAttachmentBehavior : 附着行为
6. UIDynamicItemBehavior : 动力元素行为
