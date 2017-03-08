////
////  QMAudioPlayerVC.m
////  QQMusic
////
////  Created by xwmedia01 on 2017/3/8.
////  Copyright © 2017年 xwmedia01. All rights reserved.
////
//
//#import "QMAudioPlayerVC.h"
//
//@interface QMAudioPlayerVC ()
//
//@end
//
//@implementation QMAudioPlayerVC
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//
//- (void)showPlayingViewAnimation
//{
//    void -[QMAudioPlayerVC showPlayingViewAnimation](void * self, void * _cmd) {
//        r7 = sp + 0xc;
//        asm{ bfc        r4, #0x0, #0x4 };
//        asm{ vst1.64    {d8, d9}, [r4:0x80] };
//        *((sp - 0x18) + 0x10) = d10;
//        sp = sp - 0x18 - 0x350;
//        r10 = self;
//        r1 = *___stack_chk_guard;
//        arg_32C = r1;
//        sub_12f6b50(@"Aniamtion - show", r1, 0x272725c, 0x272720c);
//        r8 = @selector(playingView);
//        loc_e08118(r10, r8);
//        r7 = r7;
//        r5 = sub_e08128();
//        arg_7C = @selector(albumMode);
//        r0 = loc_e08118(r5, @selector(albumMode));
//        r3 = 0x272720c;
//        r1 = 0x27271dc;
//        r2 = 0x272725c;
//        if (r0 == 0x2) {
//            r3 = 0x27271fc;
//        }
//        sub_12f6f2e(0x1, r1, r2, r3);
//        loc_e08110(r5);
//        loc_e08118(r10, @selector(setIsPlayingViewAnimating:), 0x1);
//        r5 = loc_e08118(@class(UIView), @selector(alloc), 0x29b7f5c);
//        r11 = @selector(view);
//        loc_e08118(r10, r11);
//        r7 = r7;
//        r6 = sub_e08128();
//        if (r6 != 0x0) {
//            loc_e08138();
//            asm{ ldm        r4, {r2, r3, r4} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        asm{ strd       r4, r0, [sp, #0x18 + var_18] };
//        r5 = loc_e08118(r5, @selector(initWithFrame:));
//        loc_e08118(r10, @selector(setShadeView:), r5);
//        loc_e08110(r5);
//        loc_e08110(r6);
//        loc_e08118(r10, @selector(shadeView));
//        r6 = sub_e08128();
//        loc_e08118(@class(UIColor), @selector(clearColor), 0x29b7d3c);
//        r4 = sub_e08128();
//        loc_e08118(r6, @selector(setBackgroundColor:), r4);
//        loc_e08110(r4);
//        loc_e08110(r6);
//        arg_98 = r11;
//        loc_e08118(r10, r11);
//        r4 = sub_e08128();
//        loc_e08118(r10, @selector(shadeView));
//        r5 = sub_e08128();
//        loc_e08118(r4, @selector(addSubview:), r5);
//        loc_e08110(r5);
//        loc_e08110(r4);
//        asm{ strd       r5, r2, [sp, #0x18 + arg_280] };
//        asm{ vmov.f64   d16, #0x1 };
//        r11 = loc_e08114(r10, __NSConcreteStackBlock, 0xd84c0b, 0x26a3120);
//        r10 = d16 >> 0x10;
//        arg_28C = r11;
//        loc_e08118(@class(NSTimer), @selector(scheduledTimerWithTimeInterval:block:repeats:), d16 & 0xffff, r10);
//        sub_e08128();
//        loc_e08110();
//        loc_e08118(@class(AudioPlayManager), @selector(sharedAudioPlayManager), 0x29b8dfc);
//        r4 = sub_e08128();
//        loc_e08118(r4, @selector(setIsPlayingViewShow:), 0x1);
//        loc_e08110(r4);
//        arg_88 = @selector(isNormalPlayerViewAnimated);
//        r4 = loc_e08118(r11, @selector(isNormalPlayerViewAnimated));
//        loc_e08118(r11, r8);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(albumViewBorder));
//        r7 = r7;
//        r6 = sub_e08128();
//        r0 = loc_e08110(r5);
//        asm{ addw       r0, pc, #0xbec };
//        if ((r4 & 0xff) != 0x0) {
//            r0 = r0 + 0x8;
//        }
//        arg_94 = r0;
//        if (r6 != 0x0) {
//            arg_58 = r6;
//            loc_e08138();
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_58 = r6;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        loc_e08118(r11, r8);
//        r6 = sub_e08128();
//        loc_e08118(r6, @selector(viewWithTag:), 0x13306df);
//        arg_60 = sub_e08128();
//        loc_e08110(r6);
//        arg_84 = r8;
//        loc_e08118(r11, r8);
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        arg_5C = sub_e08128();
//        loc_e08110(r6);
//        loc_e08118(@class(QQMusicAppDelegate), @selector(sharedQQMusicAppDelegate));
//        arg_80 = sub_e08128();
//        loc_e08118();
//        r0 = sub_e08128();
//        r10 = r11;
//        r11 = r0;
//        loc_e08118(@class(QQMusicAppDelegate), @selector(sharedQQMusicAppDelegate));
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        r0 = sub_e08128();
//        r4 = r0;
//        loc_e08118();
//        r5 = sub_e08128();
//        loc_e08118(@class(ComHelper), @selector(addVCAsSubViewInVC:inView:subVC:), r11, r5);
//        loc_e08110(r5);
//        loc_e08110(r4);
//        loc_e08110(r6);
//        r8 = r10;
//        loc_e08110(r11);
//        loc_e08110(arg_80);
//        arg_80 = @selector(albumViewFrame);
//        loc_e08138();
//        arg_98 = @selector(getCenterByRect:);
//        asm{ ldrd       r3, r0, [sp, #0x18 + arg_250] };
//        asm{ ldrd       r1, r5, [sp, #0x18 + arg_258] };
//        asm{ stm.w      sp, {r0, r1, r5} };
//        loc_e08138();
//        r4 = loc_e08118(r8, arg_88);
//        r5 = @selector(numberWithFloat:);
//        loc_e08118(*0x29b7c1c, r5, 0x0);
//        r7 = r7;
//        r10 = sub_e08128();
//        if ((r4 & 0xff) != 0x0) {
//            loc_e08118(*0x29b7c1c, r5, 0x3f19999a);
//            r4 = sub_e08128();
//            arg_78 = r5;
//            loc_e08118(*0x29b7c1c, r5, 0x3f800000);
//            r5 = sub_e08128();
//            r11 = @selector(arrayWithObjects:count:);
//            loc_e08118(@class(NSArray), r11, sp + 0x340, 0x3);
//            r7 = r7;
//        }
//        else {
//            loc_e08118(*0x29b7c1c, r5, 0x0);
//            r4 = sub_e08128();
//            arg_78 = r5;
//            loc_e08118(*0x29b7c1c, r5, 0x0);
//            r5 = sub_e08128();
//            r11 = @selector(arrayWithObjects:count:);
//            loc_e08118(@class(NSArray), r11, sp + 0x334, 0x3);
//            r7 = r7;
//        }
//        arg_54 = sub_e08128();
//        loc_e08110(r5);
//        loc_e08110(r4);
//        loc_e08110(r10);
//        r6 = arg_84;
//        d8 = *arg_94;
//        loc_e08118(r8, r6);
//        r7 = r7;
//        r0 = sub_e08128();
//        r5 = loc_e08118();
//        loc_e08110(r0);
//        if (r5 == 0x2) {
//            arg_94 = r11;
//            r10 = @selector(animationWithKeyPath:);
//            loc_e08118(@class(CABasicAnimation), r10, @"opacity");
//            r0 = sub_e08128();
//            asm{ vmov.i32   d16, #0x0 };
//            arg_9C = r8;
//            r11 = r0;
//            arg_6C = @selector(numberWithDouble:);
//            loc_e08118(@class(NSNumber), @selector(numberWithDouble:), d16 & 0xffff, d16 >> 0x10);
//            r4 = sub_e08128();
//            arg_68 = @selector(setFromValue:);
//            loc_e08118(r11, @selector(setFromValue:), r4);
//            loc_e08110(r4);
//            asm{ ldrd       r2, r3, [sp, #0x18 + arg_8C] };
//            loc_e08118(@class(NSNumber), @selector(numberWithDouble:));
//            r4 = sub_e08128();
//            arg_50 = @selector(setToValue:);
//            loc_e08118(r11, @selector(setToValue:), r4);
//            loc_e08110(r4);
//            loc_e08118(r8, arg_84);
//            r4 = sub_e08128();
//            loc_e08118(r4, @selector(albumBaseView));
//            r5 = sub_e08128();
//            arg_74 = @selector(layer);
//            loc_e08118(r5, @selector(layer));
//            r7 = r7;
//            r6 = sub_e08128();
//            arg_70 = @selector(addAnimation:forKey:);
//            loc_e08118(r6, @selector(addAnimation:forKey:), r11, @"group");
//            loc_e08110(r6);
//            loc_e08110(r5);
//            loc_e08110(r4);
//            loc_e08110(r11);
//            r11 = @selector(setDuration:);
//        }
//        else {
//            loc_e08118(r8, r6);
//            r4 = sub_e08128();
//            loc_e08118(r4, @selector(stopAlbumRotation));
//            loc_e08110(r4);
//            loc_e08118(r8, r6);
//            r10 = sub_e08128();
//            loc_e08118(r10, @selector(albumView));
//            r0 = sub_e08128();
//            arg_9C = r8;
//            r11 = r0;
//            loc_e08118(r8, @selector(angle));
//            sub_e08bc0();
//            asm{ ldm        r6, {r2, r3, r6} };
//            asm{ ldrd       r4, r5, [sp, #0x18 + arg_248] };
//            asm{ strd       r4, r5, [sp, #0x18 + var_10] };
//            asm{ strd       r6, r0, [sp, #0x18 + var_18] };
//            loc_e08118(r11, @selector(setTransform:));
//            loc_e08110(r11);
//            loc_e08110(r10);
//            loc_e08138();
//            asm{ ldrd       r3, r0, [sp, #0x18 + arg_220] };
//            asm{ ldrd       r1, r2, [sp, #0x18 + arg_228] };
//            asm{ stm.w      sp, {r0, r1, r2} };
//            loc_e08138();
//            asm{ ldrd       r2, r3, [sp, #0x18 + arg_230] };
//            loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//            asm{ vmov.f32   d16, #0x5 };
//            asm{ vmov.f32   d17, #0xfffffffb };
//            asm{ vadd.f32   d0, d0, d16 };
//            r4 = sub_e08128();
//            asm{ vadd.f32   d1, d1, d17 };
//            loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_260, arg_264);
//            r6 = sub_e08128();
//            asm{ ldrd       r2, r3, [sp, #0x18 + arg_260] };
//            loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//            r5 = sub_e08128();
//            arg_94 = @selector(arrayWithObjects:count:);
//            loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x328, 0x3);
//            arg_64 = sub_e08128();
//            loc_e08110(r5);
//            loc_e08110(r6);
//            loc_e08110(r4);
//            loc_e08138();
//            r4 = r8;
//            loc_e08138();
//            asm{ vdiv.f32   s0, s18, s0 };
//            loc_e08118(@class(NSNumber), arg_78, arg_20C);
//            r8 = sub_e08128();
//            loc_e08138();
//            asm{ vmov.f32   d1, #0x2 };
//            asm{ vmov.f32   d16, #0x1 };
//            asm{ vdiv.f32   s0, s2, s0 };
//            asm{ vadd.f32   d0, d0, d16 };
//            loc_e08118(@class(NSNumber), arg_78, arg_1FC);
//            r5 = sub_e08128();
//            loc_e08118(@class(NSNumber), arg_78, 0x3f800000);
//            r6 = sub_e08128();
//            loc_e08118(@class(NSArray), arg_94, sp + 0x31c, 0x3);
//            arg_4C = sub_e08128();
//            loc_e08110(r6);
//            loc_e08110(r5);
//            loc_e08110(r8);
//            loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"position");
//            r8 = sub_e08128();
//            arg_48 = r8;
//            loc_e08118(r8, @selector(setValues:), arg_64);
//            loc_e08118(r8, @selector(setKeyTimes:), arg_54);
//            loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"transform.scale");
//            r0 = sub_e08128();
//            arg_44 = r0;
//            r10 = r0;
//            loc_e08118();
//            loc_e08118(r10, @selector(setKeyTimes:), arg_54);
//            loc_e08118(@class(CAAnimationGroup), @selector(animation));
//            r5 = sub_e08128();
//            arg_2C = r5;
//            asm{ strd       r8, sl, [sp, #0x18 + arg_2F4] };
//            loc_e08118(@class(NSArray), arg_94, sp + 0x314, 0x2);
//            r4 = sub_e08128();
//            loc_e08118(r5, @selector(setAnimations:), r4);
//            loc_e08110(r4);
//            r8 = r5;
//            asm{ strd       r2, r3, [sp, #0x18 + arg_34] };
//            loc_e08118(r5, @selector(setDuration:), d8 & 0xffff, d8 >> 0x10);
//            loc_e08118(arg_9C, arg_84);
//            r4 = sub_e08128();
//            loc_e08118(r4, @selector(albumBaseView));
//            r5 = sub_e08128();
//            arg_74 = @selector(layer);
//            loc_e08118(r5, @selector(layer));
//            r6 = sub_e08128();
//            arg_70 = @selector(addAnimation:forKey:);
//            loc_e08118(r6, @selector(addAnimation:forKey:), r8, @"group");
//            loc_e08110(r6);
//            r10 = @selector(animationWithKeyPath:);
//            loc_e08110(r5);
//            loc_e08110(r4);
//            loc_e08118(@class(CABasicAnimation), r10, @"opacity");
//            asm{ vmov.i32   d16, #0x0 };
//            r11 = sub_e08128();
//            arg_6C = @selector(numberWithDouble:);
//            loc_e08118(@class(NSNumber), @selector(numberWithDouble:), 0x99999999 & 0xffff, 0x99999999 >> 0x10);
//            r4 = sub_e08128();
//            arg_68 = @selector(setFromValue:);
//            loc_e08118(r11, @selector(setFromValue:), r4);
//            loc_e08110(r4);
//            loc_e08118(@class(NSNumber), @selector(numberWithDouble:), 0x99999999 & 0xffff, 0x99999999 >> 0x10);
//            r4 = sub_e08128();
//            arg_50 = @selector(setToValue:);
//            loc_e08118(r11, @selector(setToValue:), r4);
//            loc_e08110(r4);
//            loc_e08118(@class(CAAnimationGroup), @selector(animation));
//            r6 = sub_e08128();
//            loc_e08118(@class(NSArray), arg_94, sp + 0x20c, 0x1);
//            r4 = sub_e08128();
//            loc_e08118(r6, @selector(setAnimations:), r4);
//            loc_e08110(r4);
//            asm{ ldrd       r2, r3, [sp, #0x18 + arg_34] };
//            loc_e08118(r6, @selector(setDuration:));
//            loc_e08118(arg_58, arg_74);
//            r7 = r7;
//            r0 = sub_e08128();
//            r4 = r0;
//            loc_e08118();
//            loc_e08110(r4);
//            loc_e08110(r6);
//            r0 = r11;
//            r11 = @selector(setDuration:);
//            loc_e08110(r0);
//            loc_e08110(arg_2C);
//            loc_e08110(arg_44);
//            loc_e08110(arg_48);
//            loc_e08110(arg_4C);
//            loc_e08110(arg_64);
//        }
//        arg_80 = r10;
//        loc_e08118(@class(CABasicAnimation), r10, ("/System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration" | 0x1990000) + 0xd83d70);
//        asm{ vmov.i32   d16, #0x0 };
//        r5 = sub_e08128();
//        arg_64 = r5;
//        loc_e08118(@class(NSNumber), arg_6C, 0x99999999 & 0xffff, 0x99999999 >> 0x10);
//        r4 = sub_e08128();
//        loc_e08118(r5, arg_68, r4);
//        loc_e08110(r4);
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_8C] };
//        loc_e08118(@class(NSNumber), arg_6C);
//        r7 = r7;
//        r4 = sub_e08128();
//        loc_e08118(r5, arg_50, r4);
//        loc_e08110(r4);
//        asm{ strd       r2, r3, [sp, #0x18 + arg_8C] };
//        loc_e08118(r5, r11, d8 & 0xffff, d8 >> 0x10);
//        if ((loc_e08118(arg_9C, arg_88) & 0xff) == 0x0) goto loc_d83f42;
//        
//    loc_d83df8:
//        loc_e08118(arg_60, arg_74);
//        r5 = sub_e08128();
//        loc_e08118();
//        loc_e08110(r5);
//        loc_e08118(arg_5C, arg_74);
//        r0 = sub_e08128();
//        r5 = r0;
//        loc_e08118();
//        loc_e08110(r5);
//        r8 = arg_84;
//        loc_e08118(arg_9C, r8);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(lyricWithRecommendView));
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        r0 = sub_e08128();
//        r4 = r0;
//        loc_e08118();
//        loc_e08110(r4);
//        loc_e08110(r6);
//        loc_e08110(r5);
//        loc_e08118(arg_9C, r8);
//        r7 = r7;
//        r0 = sub_e08128();
//        r4 = r0;
//        if (loc_e08118() != 0x3) goto loc_d83f3c;
//        
//    loc_d83ec6:
//        r5 = loc_e08118(arg_9C, @selector(isCustomPlayerView));
//        loc_e08110(r4);
//        if ((r5 & 0xff) != 0x0) goto loc_d83f42;
//        
//    loc_d83ee6:
//        loc_e08118(arg_9C, r8);
//        r4 = sub_e08128();
//        loc_e08118(r4, @selector(singerPortraitView));
//        r0 = sub_e08128();
//        r5 = r0;
//        loc_e08118();
//        r7 = r7;
//        r6 = sub_e08128();
//        loc_e08118();
//        loc_e08110(r6);
//        loc_e08110(r5);
//        goto loc_d83f3c;
//        
//    loc_d83f3c:
//        loc_e08110(r4);
//        goto loc_d83f42;
//        
//    loc_d83f42:
//        r4 = loc_e08118(arg_9C, arg_88);
//        r5 = arg_78;
//        loc_e08118(*0x29b7c1c, r5, 0x0);
//        r7 = r7;
//        r11 = sub_e08128();
//        if ((r4 & 0xff) != 0x0) {
//            loc_e08118(*0x29b7c1c, r5, 0x3f19999a);
//            r4 = sub_e08128();
//            loc_e08118(*0x29b7c1c, r5, 0x3f4ccccd);
//            r10 = sub_e08128();
//            loc_e08118(*0x29b7c1c, r5, 0x3f800000);
//            r5 = sub_e08128();
//            loc_e08118(@class(NSArray), arg_94, sp + 0x304, 0x4);
//            r7 = r7;
//            r6 = sub_e08128();
//            loc_e08110(r5);
//            loc_e08110(r10);
//        }
//        else {
//            loc_e08118(*0x29b7c1c, r5, 0x0);
//            r0 = sub_e08128();
//            arg_88 = r0;
//            loc_e08118(*0x29b7c1c, r5, 0x0);
//            r10 = sub_e08128();
//            loc_e08118(*0x29b7c1c, r5, 0x0);
//            r4 = sub_e08128();
//            loc_e08118(@class(NSArray), arg_94, sp + 0x2f4, 0x4);
//            r7 = r7;
//            r6 = sub_e08128();
//            loc_e08110(r4);
//            loc_e08110(r10);
//        }
//        loc_e08110();
//        loc_e08110(r11);
//        arg_88 = r6;
//        loc_e08138();
//        asm{ ldrd       r3, r0, [sp, #0x18 + arg_1D4] };
//        asm{ ldrd       r1, r2, [sp, #0x18 + arg_1DC] };
//        asm{ stm.w      sp, {r0, r1, r2} };
//        loc_e08138();
//        loc_e08118(@class(CAKeyframeAnimation), arg_80, @"position");
//        arg_80 = sub_e08128();
//        loc_e08138();
//        loc_e08138();
//        asm{ vmov.f32   d8, #0xfffffffb };
//        asm{ vadd.f32   d16, d9, d0 };
//        asm{ vmul.f32   d0, d16, d8 };
//        arg_84 = @selector(valueWithCGPoint:);
//        loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_1E4, arg_1C0);
//        r0 = sub_e08128();
//        arg_7C = r0;
//        loc_e08138();
//        loc_e08138();
//        asm{ vadd.f32   d16, d9, d0 };
//        asm{ vmul.f32   d0, d16, d8 };
//        loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_1E4, arg_1A0);
//        asm{ vmov.f32   d9, #0x1 };
//        r10 = sub_e08128();
//        asm{ vadd.f32   d0, d0, d9 };
//        loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_1E4, arg_1E8);
//        r11 = sub_e08128();
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_1E4] };
//        loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//        r6 = sub_e08128();
//        loc_e08118(@class(NSArray), arg_94, sp + 0x2e4, 0x4);
//        r5 = sub_e08128();
//        arg_6C = @selector(setValues:);
//        loc_e08118(arg_80, @selector(setValues:), r5);
//        loc_e08110(r5);
//        loc_e08110(r6);
//        loc_e08110(r11);
//        loc_e08110(r10);
//        loc_e08110(arg_7C);
//        arg_94 = @selector(setKeyTimes:);
//        loc_e08118(arg_80, @selector(setKeyTimes:), arg_88);
//        loc_e08118(arg_80, @selector(setDelegate:), arg_9C);
//        loc_e08118(arg_80, @selector(setValue:forKey:), @"showPlayingView", @"myAnimationId");
//        arg_74 = @selector(setDuration:);
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_8C] };
//        loc_e08118(arg_80, @selector(setDuration:));
//        loc_e08118(arg_9C, @selector(pageHeaderView));
//        r4 = sub_e08128();
//        arg_7C = @selector(layer);
//        loc_e08118(r4, @selector(layer));
//        r5 = sub_e08128();
//        arg_78 = @selector(addAnimation:forKey:);
//        loc_e08118(r5, @selector(addAnimation:forKey:), arg_80, @"position");
//        loc_e08110(r5);
//        loc_e08110(r4);
//        loc_e08138();
//        asm{ ldrd       r3, r0, [sp, #0x18 + arg_17C] };
//        asm{ ldrd       r1, r2, [sp, #0x18 + arg_184] };
//        asm{ stm.w      sp, {r0, r1, r2} };
//        loc_e08138();
//        loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"position");
//        arg_70 = sub_e08128();
//        loc_e08138();
//        asm{ vmul.f32   d0, d0, d8 };
//        loc_e08118(@class(NSValue), arg_84, arg_18C, arg_178);
//        r0 = sub_e08128();
//        arg_50 = r0;
//        loc_e08138();
//        asm{ vmul.f32   d0, d0, d8 };
//        loc_e08118(@class(NSValue), arg_84, arg_18C, arg_168);
//        r8 = sub_e08128();
//        asm{ vadd.f32   d0, d0, d9 };
//        loc_e08118(@class(NSValue), arg_84, arg_18C, arg_190);
//        r5 = sub_e08128();
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_18C] };
//        loc_e08118(@class(NSValue), arg_84);
//        r4 = sub_e08128();
//        arg_4C = @selector(arrayWithObjects:count:);
//        loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x2d4, 0x4);
//        r6 = sub_e08128();
//        loc_e08118(arg_70, arg_6C, r6);
//        loc_e08110(r6);
//        loc_e08110(r4);
//        loc_e08110(r5);
//        loc_e08110(r8);
//        loc_e08110(arg_50);
//        loc_e08118(arg_70, arg_94, arg_88);
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_8C] };
//        loc_e08118(arg_70, arg_74);
//        arg_50 = @selector(playingView);
//        loc_e08118(arg_9C, @selector(playingView));
//        r4 = sub_e08128();
//        loc_e08118(r4, @selector(headerView));
//        r0 = sub_e08128();
//        r5 = r0;
//        loc_e08118();
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        loc_e08110(r6);
//        loc_e08110(r5);
//        loc_e08110(r4);
//        r4 = arg_9C;
//        arg_68 = @selector(footViewFrame);
//        loc_e08138();
//        asm{ ldrd       r3, r0, [sp, #0x18 + arg_144] };
//        asm{ ldrd       r1, r2, [sp, #0x18 + arg_14C] };
//        asm{ stm.w      sp, {r0, r1, r2} };
//        loc_e08138();
//        loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"position");
//        arg_98 = sub_e08128();
//        arg_40 = @class(NSValue);
//        r5 = @selector(sharedApplication);
//        arg_2C = arg_154;
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        arg_48 = sub_e08128();
//        r11 = @selector(isStatusBarHidden);
//        if ((loc_e08118() & 0xff) == 0x0) goto loc_d84584;
//        
//    loc_d8457a:
//        arg_3C = 0x0;
//        arg_8 = 0x0;
//        arg_4 = 0x0;
//        goto loc_d84634;
//        
//    loc_d84634:
//        r6 = @selector(screenHeight);
//        r0 = loc_e08118(@class(SkinAutoSize), r6);
//        r0 << 0x10 | r0;
//        arg_30 = 0x0;
//        arg_0 = 0x0;
//        arg_44 = 0x0;
//        arg_38 = 0x0;
//        arg_34 = 0x0;
//        goto loc_d84776;
//        
//    loc_d84776:
//        loc_e08138();
//        asm{ vmov.f32   d16, #0x5 };
//        asm{ vmul.f32   d16, d0, d16 };
//        asm{ vadd.f32   d0, d8, d16 };
//        loc_e08118(arg_40, arg_84, arg_2C, arg_FC);
//        r0 = sub_e08128();
//        arg_2C = r0;
//        arg_20 = arg_154;
//        arg_24 = @class(NSValue);
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r0 = sub_e08128();
//        arg_28 = r0;
//        if ((loc_e08118() & 0xff) == 0x0) goto loc_d847e6;
//        
//    loc_d847d8:
//        arg_40 = r4;
//        arg_14 = 0x0;
//        saved_lr = 0x0;
//        r5 = arg_68;
//        saved_r7 = 0x0;
//        goto loc_d84890;
//        
//    loc_d84890:
//        r0 = loc_e08118(@class(SkinAutoSize), r6);
//        r0 << 0x10 | r0;
//        arg_C = 0x0;
//        r10 = 0x0;
//        var_4 = 0x0;
//        arg_1C = 0x0;
//        arg_18 = 0x0;
//        arg_10 = 0x0;
//        r4 = arg_9C;
//        goto loc_d849d6;
//        
//    loc_d849d6:
//        r8 = r4;
//        loc_e08138();
//        asm{ vmov.f32   d16, #0x5 };
//        asm{ vmul.f32   d16, d0, d16 };
//        asm{ vadd.f32   d0, d8, d16 };
//        loc_e08118(arg_24, arg_84, arg_20, arg_AC);
//        asm{ vmov.f32   d16, #0xffffffff };
//        r11 = sub_e08128();
//        asm{ vadd.f32   d0, d0, d16 };
//        loc_e08118(@class(NSValue), arg_84, arg_154, arg_158);
//        r6 = sub_e08128();
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_154] };
//        loc_e08118(@class(NSValue), arg_84);
//        r5 = sub_e08128();
//        loc_e08118(@class(NSArray), arg_4C, sp + 0x2c4, 0x4);
//        r7 = r7;
//        r4 = sub_e08128();
//        loc_e08118(arg_98, arg_6C, r4);
//        loc_e08110(r4);
//        loc_e08110(r5);
//        loc_e08110(r6);
//        loc_e08110(r11);
//        r5 = arg_18;
//        if (CPU_FLAGS & E) {
//            loc_e08110();
//        }
//        r4 = arg_40;
//        if (CPU_FLAGS & E) {
//            loc_e08110();
//        }
//        r5 = r8;
//        if (arg_C == 0x1) {
//            loc_e08110();
//            loc_e08110(var_4);
//        }
//        r8 = arg_88;
//        if (arg_14 == 0x1) {
//            loc_e08110(saved_r7);
//            loc_e08110(saved_lr);
//        }
//        loc_e08110(arg_28);
//        loc_e08110(arg_2C);
//        if (CPU_FLAGS & E) {
//            loc_e08110();
//        }
//        if (CPU_FLAGS & E) {
//            loc_e08110();
//        }
//        if (arg_30 == 0x1) {
//            loc_e08110();
//            loc_e08110(arg_0);
//        }
//        if (arg_3C == 0x1) {
//            loc_e08110(arg_4);
//            loc_e08110(arg_8);
//        }
//        loc_e08110(arg_48);
//        r4 = arg_98;
//        loc_e08118(r4, arg_94, r8);
//        asm{ ldrd       r2, r3, [sp, #0x18 + arg_8C] };
//        loc_e08118(r4, arg_74);
//        loc_e08118(r5, arg_50);
//        r10 = sub_e08128();
//        loc_e08118(r10, @selector(footView));
//        r0 = sub_e08128();
//        r5 = r0;
//        loc_e08118();
//        r7 = r7;
//        r0 = sub_e08128();
//        r2 = r4;
//        r6 = r0;
//        loc_e08118();
//        loc_e08110(r6);
//        loc_e08110(r5);
//        loc_e08110(r10);
//        loc_e08110(r4);
//        loc_e08110(arg_70);
//        loc_e08110(arg_80);
//        loc_e08110(r8);
//        loc_e08110(arg_64);
//        loc_e08110(arg_54);
//        loc_e08110(arg_5C);
//        loc_e08110(arg_60);
//        loc_e08110(arg_58);
//        loc_e08110(arg_28C);
//        r1 = *___stack_chk_guard;
//        r0 = r1 - arg_32C;
//        COND = r0 == 0x0;
//        if (COND) {
//            r4 = sp + 0x350;
//        }
//        if (CPU_FLAGS & E) {
//            asm{ vld1.64    {d8, d9}, [r4:0x80] };
//        }
//        if (CPU_FLAGS & E) {
//            r4 = r7 - 0x18;
//        }
//        if (CPU_FLAGS & E) {
//            sp = r4;
//        }
//        if (CPU_FLAGS & E) {
//            sp = sp + 0xc;
//        }
//        if (CPU_FLAGS & E) {
//            return;
//        }
//        r0 = loc_e07ffc();
//        r5 = r0;
//        r0 = *(r5 + 0x14);
//        r4 = @selector(shadeView);
//        loc_e08118(r0, r4);
//        r7 = sp + 0xc;
//        r6 = sub_e08128();
//        loc_e08110();
//        if (r6 != 0x0) {
//            r0 = *(r5 + 0x14);
//            loc_e08118(r0, r4);
//            r4 = sub_e08128();
//            r1 = @selector(removeFromSuperview);
//            loc_e08118(r4, r1);
//            r0 = loc_e0812c();
//            loc_1c09734(r0, r1, r2);
//        }
//        return;
//        
//    loc_d847e6:
//        loc_e08118(@class(UIDevice), @selector(currentDevice), 0x29b7ce8);
//        saved_lr = sub_e08128();
//        loc_e08118();
//        r7 = r7;
//        saved_r7 = sub_e08128();
//        r0 = loc_e08118();
//        asm{ vmov.f32   d0, #0x7 };
//        r0 << 0x10 | r0;
//        asm{ vcmpe.f32  s2, s0 };
//        if (asm{ vmrs       APSR_nzcv, fpscr }) goto loc_d84888;
//        
//    loc_d84844:
//        r6 = loc_e08118(@class(SkinAutoSize), r6);
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r1 = sub_e08128();
//        if (r1 != 0x0) {
//            arg_40 = r4;
//            var_4 = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            var_4 = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//            arg_40 = r4;
//        }
//        r6 << 0x10 | r6;
//        r0 = sub_e08430();
//        r0 << 0x10 | r0;
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r0 = sub_e08128();
//        r4 = arg_9C;
//        r1 = r0;
//        if (r1 != 0x0) {
//            arg_1C = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_1C = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        r0 = sub_e0842c();
//        r0 << 0x10 | r0;
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r1 = sub_e08128();
//        asm{ vcmpe.f32  s18, s20 };
//        if (!asm{ vmrs       APSR_nzcv, fpscr }) {
//            if (r1 != 0x0) {
//                arg_18 = r1;
//                loc_e08138();
//                asm{ ldm        r3, {r0, r1, r2, r3} };
//            }
//            else {
//                asm{ vmov.i32   q8, #0x0 };
//                arg_18 = 0x0;
//                asm{ vst1.64    {d16, d17}, [r0] };
//            }
//            r5 = arg_68;
//            r0 = sub_e08430();
//            r0 << 0x10 | r0;
//            r10 = 0x0;
//            r0 = 0x1;
//        }
//        else {
//            if (r1 != 0x0) {
//                arg_18 = r1;
//                loc_e08138();
//                asm{ ldm        r3, {r0, r1, r2, r3} };
//            }
//            else {
//                asm{ vmov.i32   q8, #0x0 };
//                arg_18 = 0x0;
//                asm{ vst1.64    {d16, d17}, [r0] };
//            }
//            r5 = arg_68;
//            r0 = sub_e0842c();
//            r0 << 0x10 | r0;
//            r10 = 0x1;
//            r0 = 0x0;
//        }
//        asm{ vsub.f32   d8, d8, d16 };
//        arg_10 = r0;
//        arg_14 = 0x1;
//        arg_C = 0x1;
//        goto loc_d849d6;
//        
//    loc_d84888:
//        r5 = arg_68;
//        arg_40 = r4;
//        arg_14 = 0x1;
//        goto loc_d84890;
//        
//    loc_d84584:
//        loc_e08118(@class(UIDevice), @selector(currentDevice), 0x29b7ce8);
//        arg_8 = sub_e08128();
//        loc_e08118();
//        r7 = r7;
//        arg_4 = sub_e08128();
//        r0 = loc_e08118();
//        asm{ vmov.f32   d0, #0x7 };
//        r0 << 0x10 | r0;
//        asm{ vcmpe.f32  s2, s0 };
//        if (asm{ vmrs       APSR_nzcv, fpscr }) goto loc_d84630;
//        
//    loc_d845e2:
//        r6 = @selector(screenHeight);
//        r4 = loc_e08118(@class(SkinAutoSize), r6);
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r1 = sub_e08128();
//        if (r1 != 0x0) {
//            arg_0 = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_0 = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        r4 << 0x10 | r4;
//        r0 = sub_e08430();
//        r0 << 0x10 | r0;
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r1 = sub_e08128();
//        if (r1 != 0x0) {
//            arg_44 = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_44 = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        r0 = sub_e0842c();
//        r0 << 0x10 | r0;
//        loc_e08118(*0x29b7c98, r5);
//        r7 = r7;
//        r4 = sub_e08128();
//        asm{ vcmpe.f32  s18, s20 };
//        if (!asm{ vmrs       APSR_nzcv, fpscr }) {
//            if (r4 != 0x0) {
//                loc_e08138();
//                asm{ ldm        r3, {r0, r1, r2, r3} };
//            }
//            else {
//                asm{ vmov.i32   q8, #0x0 };
//                asm{ vst1.64    {d16, d17}, [r0] };
//            }
//            r0 = sub_e08430();
//            r0 << 0x10 | r0;
//            arg_34 = 0x0;
//            r0 = 0x1;
//        }
//        else {
//            if (r4 != 0x0) {
//                loc_e08138();
//                asm{ ldm        r3, {r0, r1, r2, r3} };
//            }
//            else {
//                asm{ vmov.i32   q8, #0x0 };
//                asm{ vst1.64    {d16, d17}, [r0] };
//            }
//            r0 = sub_e0842c();
//            r0 << 0x10 | r0;
//            r0 = 0x0;
//            arg_34 = 0x1;
//        }
//        asm{ vsub.f32   d8, d8, d16 };
//        arg_38 = r0;
//        arg_3C = 0x1;
//        arg_30 = 0x1;
//        goto loc_d84776;
//        
//    loc_d84630:
//        arg_3C = 0x1;
//        goto loc_d84634;
//    }
//
//}
//- (void)didFinishShowPlayingViewAnimation
//{
//    void -[QMAudioPlayerVC didFinishShowPlayingViewAnimation](void * self, void * _cmd) {
//        r4 = self;
//        r8 = @selector(sharedAudioPlayManager);
//        loc_e08118(@class(AudioPlayManager), r8);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(setIsPlayingViewShow:), 0x1);
//        loc_e08110(r5);
//        loc_e08118(r4, @selector(setIsTopViewController:), 0x1);
//        r10 = @selector(playingView);
//        loc_e08118(r4, r10);
//        r6 = sub_e08128();
//        loc_e08118(r6, @selector(singleTap));
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(setEnabled:), 0x1);
//        loc_e08110(r5);
//        loc_e08110(r6);
//        loc_e08118(r4, r10);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(downGestureRecognizer));
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        loc_e08110(r6);
//        loc_e08110(r5);
//        loc_e08118(r4, r10);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(longPressGesture));
//        r0 = sub_e08128();
//        r6 = r0;
//        loc_e08118();
//        loc_e08110(r6);
//        loc_e08110(r5);
//        r5 = @selector(shadeView);
//        loc_e08118(r4, r5);
//        r7 = sp + 0xc;
//        r6 = sub_e08128();
//        loc_e08110();
//        if (r6 != 0x0) {
//            loc_e08118(r4, r5);
//            r7 = r7;
//            r5 = sub_e08128();
//            loc_e08118(r5, @selector(removeFromSuperview));
//            loc_e08110(r5);
//        }
//        r11 = @selector(nowPlayingNavigationTitle);
//        loc_e08118(r4, r11);
//        r7 = r7;
//        r6 = sub_e08128();
//        r5 = loc_e08118(r6, @selector(isHidden));
//        loc_e08110(r6);
//        if ((r5 & 0xff) == 0x0) {
//            loc_e08118(r4, r11);
//            r5 = sub_e08128();
//            loc_e08118(r5, @selector(shutdownLabel));
//            loc_e08110(r5);
//            loc_e08118(r4, r11);
//            r7 = r7;
//            r5 = sub_e08128();
//            loc_e08118(r5, @selector(restartLabel));
//            loc_e08110(r5);
//        }
//        loc_e08118(r4, r10);
//        r5 = sub_e08128();
//        loc_e08118(r5, @selector(stopAlbumRotation));
//        loc_e08110(r5);
//        loc_e08118(r4, r10);
//        r6 = sub_e08128();
//        r11 = @selector(angle);
//        r0 = loc_e08118(r4, r11);
//        loc_e08118(r6, @selector(startAlbumRotationWithAngle:), r0);
//        loc_e08110(r6);
//        loc_e08118(@class(AudioPlayManager), r8);
//        r7 = r7;
//        r6 = sub_e08128();
//        r5 = loc_e08118(r6, @selector(playStatus));
//        loc_e08110(r6);
//        if (r5 != 0x7) {
//            loc_e08118(r4, r10);
//            r5 = sub_e08128();
//            r0 = loc_e08118(r4, r11);
//            loc_e08118(r5, @selector(pauseAlbumRotationWithAngle:), r0);
//            loc_e08110(r5);
//        }
//        loc_e08118(r4, @selector(loadCPDAd));
//        asm{ uxtb       r0, r0 };
//        if (loc_e08118(r4, @selector(shouldUpdateBulletCommentCount)) == 0x1) {
//            loc_e08118(r4, @selector(updateBulletCommentCount));
//        }
//        asm{ uxtb       r0, r0 };
//        if (loc_e08118(r4, @selector(hasDisplayBulletComment)) == 0x1) {
//            loc_e08118(r4, @selector(updateBlurForAlbumImage));
//        }
//        loc_e08118(r4, @selector(showTipIfAny));
//        r0 = r4;
//        r0 = loc_e08124(r0, @selector(showGuessLikeTipIfNecessary));
//        loc_1c0972c(r0);
//        return;
//    }
//
//}
//
//- (void)returnMiniPlayerAnimation
//{
//    r7 = sp + 0xc;
//    asm{ bfc        r4, #0x0, #0x4 };
//    asm{ vst1.64    {d8, d9, d10, d11}, [r4:0x80] };
//    sp = sp - 0x20 - 0x300;
//    r5 = self;
//    r10 = @selector(playingView);
//    arg_2DC = *___stack_chk_guard;
//    arg_70 = r10;
//    loc_e08118(r5, r10);
//    r7 = r7;
//    r4 = sub_e08128();
//    arg_60 = @selector(albumMode);
//    r0 = loc_e08118(r4, @selector(albumMode));
//    r3 = 0x272720c;
//    r1 = 0x27271dc;
//    if (r0 == 0x2) {
//        r3 = 0x27271fc;
//    }
//    sub_12f6f2e(0x1, r1, 0x13306de, r3);
//    loc_e08110(r4);
//    loc_e08118(r5, @selector(setIsPlayingViewAnimating:), 0x1);
//    loc_e08118(r5, @selector(reCoverBeforeAnimationStart));
//    loc_e08118(r5, r10);
//    r6 = sub_e08128();
//    loc_e08118(r6, @selector(viewWithTag:), 0x13306df);
//    arg_6C = sub_e08128();
//    loc_e08110(r6);
//    loc_e08118(r5, r10);
//    r0 = sub_e08128();
//    r6 = r0;
//    loc_e08118();
//    arg_68 = sub_e08128();
//    loc_e08110(r6);
//    r10 = r5;
//    arg_84 = loc_e08118(r5, @selector(isNormalPlayerViewAnimated));
//    r6 = 0x29b7c1c;
//    r11 = @selector(numberWithFloat:);
//    r0 = *r6;
//    loc_e08118(r0, r11, 0x0);
//    r7 = r7;
//    r0 = sub_e08128();
//    asm{ addw       r5, pc, #0xd08 };
//    r8 = r0;
//    asm{ uxtb       r0, r4 };
//    if (r0 == 0x0) {
//        r5 = r5 + 0x8;
//    }
//    if (r0 != 0x0) {
//        r0 = *r6;
//        loc_e08118(r0, r11, 0x3f000000);
//        r4 = sub_e08128();
//        r0 = *r6;
//        loc_e08118(r0, r11, 0x3f800000);
//        r6 = sub_e08128();
//        arg_64 = @selector(arrayWithObjects:count:);
//        loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x2e4, 0x3);
//        r7 = r7;
//    }
//    else {
//        r0 = *r6;
//        loc_e08118(r0, r11, 0x0);
//        r4 = sub_e08128();
//        r0 = *r6;
//        loc_e08118(r0, r11, 0x0);
//        r6 = sub_e08128();
//        arg_64 = @selector(arrayWithObjects:count:);
//        loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x2f0, 0x3);
//        r7 = r7;
//    }
//    arg_88 = sub_e08128();
//    loc_e08110(r6);
//    loc_e08110(r4);
//    loc_e08110(r8);
//    r8 = arg_70;
//    d8 = *r5;
//    loc_e08118(r10, r8);
//    r4 = sub_e08128();
//    loc_e08118(r4, @selector(pageControl));
//    r7 = r7;
//    r5 = sub_e08128();
//    r6 = loc_e08118(r5, @selector(currentPage));
//    loc_e08110(r5);
//    loc_e08110(r4);
//    if (r6 != 0x1) goto loc_d8140c;
//    
//loc_d812bc:
//    loc_e08118(r10, r8);
//    r7 = r7;
//    r0 = sub_e08128();
//    r5 = loc_e08118();
//    loc_e08110(r0);
//    COND = r5 != 0x2;
//    r5 = r10;
//    if (COND) goto loc_d8142a;
//    
//loc_d812e2:
//    loc_e08118(@class(CABasicAnimation), @selector(animationWithKeyPath:), @"opacity");
//    asm{ vmov.f64   d16, #0x1 };
//    r10 = sub_e08128();
//    loc_e08118(*0x29b7c1c, @selector(numberWithDouble:), d16 & 0xffff, d16 >> 0x10);
//    r4 = sub_e08128();
//    loc_e08118(r10, @selector(setFromValue:), r4);
//    loc_e08110(r4);
//    asm{ vmov.i32   d16, #0x0 };
//    loc_e08118(*0x29b7c1c, @selector(numberWithDouble:), d16 & 0xffff, d16 >> 0x10);
//    r4 = sub_e08128();
//    loc_e08118(r10, @selector(setToValue:), r4);
//    loc_e08110(r4);
//    arg_8C = r5;
//    loc_e08118(r5, r8);
//    r4 = sub_e08128();
//    loc_e08118(r4, @selector(albumBaseView));
//    r5 = sub_e08128();
//    loc_e08118(r5, @selector(layer));
//    r7 = r7;
//    r8 = sub_e08128();
//    loc_e08118(r8, @selector(addAnimation:forKey:), r10, @"group");
//    loc_e08110(r8);
//    r0 = r5;
//    r5 = @selector(numberWithDouble:);
//    loc_e08110(r0);
//    loc_e08110(r4);
//    goto loc_d81c58;
//    
//loc_d81c58:
//    loc_e08110();
//    goto loc_d81c5c;
//    
//loc_d81c5c:
//    r11 = 0x29b7c1c;
//    arg_74 = @selector(animationWithKeyPath:);
//    loc_e08118(@class(CABasicAnimation), @selector(animationWithKeyPath:), @"opacity");
//    r7 = r7;
//    r6 = sub_e08128();
//    if ((arg_84 & 0xff) != 0x0) {
//        asm{ vmov.f64   d16, #0x1 };
//        loc_e08118();
//        r7 = r7;
//    }
//    else {
//        asm{ vmov.i32   d16, #0x0 };
//        loc_e08118();
//        r7 = r7;
//    }
//    r4 = sub_e08128();
//    loc_e08118(r6, @selector(setFromValue:), r4);
//    loc_e08110(r4);
//    asm{ vmov.i32   d16, #0x0 };
//    r0 = *r11;
//    arg_7C = r6;
//    loc_e08118(r0, r5, 0x9999999a & 0xffff, 0x9999999a >> 0x10);
//    r4 = sub_e08128();
//    loc_e08118(r6, @selector(setToValue:), r4);
//    loc_e08110(r4);
//    asm{ vmov.f64   d16, #0x5 };
//    asm{ vmul.f64   d16, d8, d16 };
//    arg_78 = @selector(setDuration:);
//    loc_e08118(r6, @selector(setDuration:), 0x9999999a & 0xffff, 0x9999999a >> 0x10);
//    arg_84 = @selector(layer);
//    loc_e08118(arg_6C, @selector(layer));
//    r4 = sub_e08128();
//    arg_80 = @selector(addAnimation:forKey:);
//    loc_e08118(r4, @selector(addAnimation:forKey:), r6, @"opacity");
//    loc_e08110(r4);
//    loc_e08118(arg_68, @selector(layer));
//    r0 = sub_e08128();
//    r4 = r0;
//    loc_e08118();
//    loc_e08110(r4);
//    r4 = r6;
//    loc_e08118(arg_8C, arg_70);
//    arg_5C = sub_e08128();
//    loc_e08118();
//    r0 = sub_e08128();
//    r6 = r0;
//    loc_e08118();
//    r0 = sub_e08128();
//    r8 = arg_70;
//    r5 = r0;
//    r11 = arg_8C;
//    loc_e08118();
//    loc_e08110(r5);
//    loc_e08110(r6);
//    loc_e08110(arg_5C);
//    loc_e08118(r11, r8);
//    r7 = r7;
//    r0 = sub_e08128();
//    r4 = r0;
//    if (loc_e08118() == 0x3) {
//        r5 = loc_e08118(r11, @selector(isCustomPlayerView));
//        loc_e08110(r4);
//        r4 = arg_7C;
//        if ((r5 & 0xff) == 0x0) {
//            loc_e08118(r11, r8);
//            r8 = sub_e08128();
//            loc_e08118(r8, @selector(singerPortraitView));
//            r0 = sub_e08128();
//            r5 = r0;
//            loc_e08118();
//            r7 = r7;
//            r0 = sub_e08128();
//            r6 = r0;
//            loc_e08118();
//            loc_e08110(r6);
//            loc_e08110(r5);
//            loc_e08110(r8);
//        }
//    }
//    else {
//        loc_e08110(r4);
//        r4 = arg_7C;
//    }
//    arg_7C = r4;
//    loc_e08138();
//    asm{ ldrd       r3, r1, [sp, #0x18 + arg_1C4] };
//    asm{ ldrd       r5, r6, [sp, #0x18 + arg_1CC] };
//    asm{ stm.w      sp, {r1, r5, r6} };
//    loc_e08138();
//    loc_e08118(@class(CAKeyframeAnimation), arg_74, @"position");
//    arg_70 = sub_e08128();
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_1D4] };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//    r0 = sub_e08128();
//    arg_60 = r0;
//    loc_e08138();
//    loc_e08138();
//    asm{ vmov.f32   d9, #0xfffffffb };
//    asm{ vadd.f32   d16, d10, d0 };
//    asm{ vmul.f32   d0, d16, d9 };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_1D4, arg_1B0);
//    r10 = sub_e08128();
//    loc_e08138();
//    loc_e08138();
//    asm{ vadd.f32   d16, d10, d0 };
//    asm{ vmul.f32   d0, d16, d9 };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_1D4, arg_190);
//    r4 = sub_e08128();
//    loc_e08118(@class(NSArray), arg_64, sp + 0x2b8, 0x3);
//    r5 = sub_e08128();
//    arg_54 = @selector(setValues:);
//    loc_e08118(arg_70, @selector(setValues:), r5);
//    loc_e08110(r5);
//    loc_e08110(r4);
//    loc_e08110(r10);
//    loc_e08110(arg_60);
//    arg_58 = @selector(setKeyTimes:);
//    loc_e08118(arg_70, @selector(setKeyTimes:), arg_88);
//    asm{ strd       r2, r3, [sp, #0x18 + arg_60] };
//    loc_e08118(arg_70, arg_78, d8 & 0xffff, d8 >> 0x10);
//    loc_e08118(r11, @selector(pageHeaderView));
//    r0 = sub_e08128();
//    r4 = r0;
//    loc_e08118();
//    r0 = sub_e08128();
//    r5 = r0;
//    loc_e08118();
//    loc_e08110(r5);
//    loc_e08110(r4);
//    loc_e08138();
//    asm{ ldrd       r3, r0, [sp, #0x18 + arg_16C] };
//    asm{ ldrd       r1, r2, [sp, #0x18 + arg_174] };
//    asm{ stm.w      sp, {r0, r1, r2} };
//    loc_e08138();
//    loc_e08118(@class(CAKeyframeAnimation), arg_74, @"position");
//    arg_5C = sub_e08128();
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_17C] };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//    r0 = sub_e08128();
//    arg_48 = r0;
//    loc_e08138();
//    asm{ vmul.f32   d0, d0, d9 };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_17C, arg_168);
//    r0 = sub_e08128();
//    arg_40 = r0;
//    loc_e08138();
//    asm{ vmul.f32   d0, d0, d9 };
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:), arg_17C, arg_158);
//    r5 = sub_e08128();
//    arg_44 = @selector(arrayWithObjects:count:);
//    loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x2ac, 0x3);
//    r6 = sub_e08128();
//    loc_e08118(arg_5C, arg_54, r6);
//    loc_e08110(r6);
//    loc_e08110(r5);
//    loc_e08110(arg_40);
//    loc_e08110(arg_48);
//    loc_e08118(arg_5C, arg_58, arg_88);
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_60] };
//    loc_e08118(arg_5C, arg_78);
//    arg_48 = @selector(playingView);
//    loc_e08118(r11, @selector(playingView));
//    r10 = sub_e08128();
//    loc_e08118(r10, @selector(headerView));
//    r0 = sub_e08128();
//    r5 = r0;
//    loc_e08118();
//    r0 = sub_e08128();
//    r6 = r0;
//    loc_e08118();
//    loc_e08110(r6);
//    loc_e08110(r5);
//    loc_e08110(r10);
//    arg_50 = @selector(footViewFrame);
//    loc_e08138();
//    asm{ ldrd       r3, r0, [sp, #0x18 + arg_134] };
//    asm{ ldrd       r1, r2, [sp, #0x18 + arg_13C] };
//    asm{ stm.w      sp, {r0, r1, r2} };
//    r4 = @selector(valueWithCGPoint:);
//    loc_e08138();
//    loc_e08118(@class(CAKeyframeAnimation), arg_74, @"position");
//    arg_74 = sub_e08128();
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_144] };
//    loc_e08118(*0x29b8150, r4);
//    r0 = sub_e08128();
//    arg_4C = r0;
//    arg_24 = *0x29b8150;
//    r11 = @selector(sharedApplication);
//    arg_20 = arg_144;
//    loc_e08118(@class(UIApplication), r11);
//    r7 = r7;
//    arg_40 = sub_e08128();
//    r8 = @selector(isStatusBarHidden);
//    if ((loc_e08118() & 0xff) == 0x0) goto loc_d8230e;
//    
//loc_d82304:
//    arg_34 = 0x0;
//    arg_8 = 0x0;
//    arg_4 = 0x0;
//    goto loc_d823c8;
//    
//loc_d823c8:
//    r5 = @selector(screenHeight);
//    r0 = loc_e08118(@class(SkinAutoSize), r5);
//    r0 << 0x10 | r0;
//    arg_28 = 0x0;
//    arg_0 = 0x0;
//    arg_3C = 0x0;
//    arg_38 = 0x0;
//    arg_30 = 0x0;
//    arg_2C = 0x0;
//    goto loc_d8252e;
//    
//loc_d8252e:
//    loc_e08138();
//    asm{ vmov.f32   d16, #0x5 };
//    asm{ vmul.f32   d16, d0, d16 };
//    asm{ vadd.f32   d0, d8, d16 };
//    loc_e08118(arg_24, r4, arg_20, arg_EC);
//    r0 = sub_e08128();
//    arg_24 = r0;
//    arg_1C = *0x29b8150;
//    arg_18 = arg_144;
//    loc_e08118(*0x29b7c98, r11);
//    r7 = r7;
//    r0 = sub_e08128();
//    arg_20 = r0;
//    if ((loc_e08118() & 0xff) == 0x0) goto loc_d8259e;
//    
//loc_d82590:
//    r8 = arg_8C;
//    arg_10 = 0x0;
//    saved_lr = 0x0;
//    saved_r7 = 0x0;
//    goto loc_d82648;
//    
//loc_d82648:
//    r0 = loc_e08118(@class(SkinAutoSize), r5);
//    r0 << 0x10 | r0;
//    r10 = 0x0;
//    var_4 = r0;
//    r11 = 0x0;
//    var_8 = r0;
//    r6 = 0x0;
//    arg_14 = r0;
//    goto loc_d82792;
//    
//loc_d82792:
//    loc_e08138();
//    asm{ vmov.f32   d16, #0x5 };
//    asm{ vmul.f32   d16, d0, d16 };
//    asm{ vadd.f32   d0, d8, d16 };
//    loc_e08118(arg_1C, r4, arg_18, arg_9C);
//    r4 = sub_e08128();
//    loc_e08118(@class(NSArray), arg_44, sp + 0x2a0, 0x3);
//    r7 = r7;
//    r5 = sub_e08128();
//    loc_e08118(arg_74, arg_54, r5);
//    loc_e08110(r5);
//    loc_e08110(r4);
//    r5 = arg_14;
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    r4 = arg_38;
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    r5 = r8;
//    if (r10 == 0x1) {
//        loc_e08110(var_8);
//        loc_e08110(var_4);
//    }
//    r10 = arg_7C;
//    if (arg_10 == 0x1) {
//        loc_e08110(saved_r7);
//        loc_e08110(saved_lr);
//    }
//    loc_e08110(arg_20);
//    loc_e08110(arg_24);
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    if (arg_28 == 0x1) {
//        loc_e08110();
//        loc_e08110(arg_0);
//    }
//    if (arg_34 == 0x1) {
//        loc_e08110(arg_4);
//        loc_e08110(arg_8);
//    }
//    loc_e08110(arg_40);
//    loc_e08110(arg_4C);
//    r4 = arg_74;
//    loc_e08118(r4, arg_58, arg_88);
//    loc_e08118(r4, @selector(setValue:forKey:), @"returnMiniPlayer", @"myAnimationId");
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_60] };
//    loc_e08118(r4, arg_78);
//    loc_e08118(r4, @selector(setDelegate:), r5);
//    loc_e08118(r5, arg_48);
//    r11 = sub_e08128();
//    loc_e08118(r11, @selector(footView));
//    r0 = sub_e08128();
//    r5 = r0;
//    loc_e08118();
//    r7 = r7;
//    r0 = sub_e08128();
//    r6 = r0;
//    loc_e08118();
//    loc_e08110(r6);
//    loc_e08110(r5);
//    loc_e08110(r11);
//    loc_e08110(r4);
//    loc_e08110(arg_5C);
//    loc_e08110(arg_70);
//    loc_e08110(r10);
//    loc_e08110(arg_88);
//    loc_e08110(arg_68);
//    loc_e08110(arg_6C);
//    r1 = *___stack_chk_guard;
//    r0 = r1 - arg_2DC;
//    COND = r0 == 0x0;
//    if (COND) {
//        r4 = sp + 0x300;
//    }
//    if (CPU_FLAGS & E) {
//        asm{ vld1.64    {d8, d9, d10, d11}, [r4:0x80] };
//    }
//    if (CPU_FLAGS & E) {
//        r4 = r7 - 0x18;
//    }
//    if (CPU_FLAGS & E) {
//        sp = r4;
//    }
//    if (CPU_FLAGS & E) {
//        sp = sp + 0xc;
//    }
//    if (CPU_FLAGS & E) {
//        return;
//    }
//    loc_e07ffc();
//    loc_e08118(@class(QMPlayerSkinItem), @selector(getCurrentPlayerSkinItem), 0x29b96bc);
//    r5 = sub_e08128();
//    r4 = 0x0;
//    if ((r5 != 0x0) && ((loc_e08118(r5, @selector(isDefaultSkin)) & 0xff) == 0x0)) {
//        r4 = 0x1;
//    }
//    loc_e08110(r5);
//    return;
//    
//loc_d8259e:
//    loc_e08118(@class(UIDevice), @selector(currentDevice), 0x29b7ce8);
//    saved_lr = sub_e08128();
//    loc_e08118();
//    r7 = r7;
//    saved_r7 = sub_e08128();
//    r0 = loc_e08118();
//    asm{ vmov.f32   d0, #0x7 };
//    r0 << 0x10 | r0;
//    asm{ vcmpe.f32  s2, s0 };
//    if (asm{ vmrs       APSR_nzcv, fpscr }) goto loc_d82640;
//    
//loc_d825fc:
//    r8 = r4;
//    r4 = loc_e08118(@class(SkinAutoSize), r5);
//    loc_e08118(*0x29b7c98, r11);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        var_4 = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        var_4 = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 << 0x10 | r4;
//    r0 = sub_e08430();
//    r0 << 0x10 | r0;
//    loc_e08118(*0x29b7c98, r11);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        var_8 = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        var_8 = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 = r8;
//    r0 = sub_e0842c();
//    r0 << 0x10 | r0;
//    loc_e08118(*0x29b7c98, r11);
//    r7 = r7;
//    r5 = sub_e08128();
//    asm{ vcmpe.f32  s18, s20 };
//    if (!asm{ vmrs       APSR_nzcv, fpscr }) {
//        if (r5 != 0x0) {
//            r8 = arg_8C;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            r8 = arg_8C;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        arg_14 = r5;
//        r0 = sub_e08430();
//        r6 = 0x0;
//        r0 << 0x10 | r0;
//        r11 = 0x1;
//    }
//    else {
//        if (r5 != 0x0) {
//            r8 = arg_8C;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            r8 = arg_8C;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        arg_14 = r5;
//        r0 = sub_e0842c();
//        r0 << 0x10 | r0;
//        r6 = 0x1;
//        r11 = 0x0;
//    }
//    asm{ vsub.f32   d8, d8, d16 };
//    r10 = 0x1;
//    arg_10 = 0x1;
//    goto loc_d82792;
//    
//loc_d82640:
//    r8 = arg_8C;
//    arg_10 = 0x1;
//    goto loc_d82648;
//    
//loc_d8230e:
//    loc_e08118(@class(UIDevice), @selector(currentDevice), 0x29b7ce8);
//    arg_8 = sub_e08128();
//    loc_e08118();
//    r7 = r7;
//    arg_4 = sub_e08128();
//    r0 = loc_e08118();
//    asm{ vmov.f32   d0, #0x7 };
//    r0 << 0x10 | r0;
//    asm{ vcmpe.f32  s2, s0 };
//    if (asm{ vmrs       APSR_nzcv, fpscr }) goto loc_d823c4;
//    
//loc_d8236c:
//    r10 = r4;
//    r5 = @selector(screenHeight);
//    r4 = loc_e08118(@class(SkinAutoSize), r5);
//    loc_e08118(@class(UIApplication), r11);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        arg_0 = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        arg_0 = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 << 0x10 | r4;
//    r0 = sub_e08430();
//    r0 << 0x10 | r0;
//    loc_e08118(@class(UIApplication), r11);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        arg_3C = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        arg_3C = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 = r10;
//    r0 = sub_e0842c();
//    r0 << 0x10 | r0;
//    loc_e08118(@class(UIApplication), r11);
//    r7 = r7;
//    asm{ vcmpe.f32  s18, s20 };
//    r1 = sub_e08128();
//    if (!asm{ vmrs       APSR_nzcv, fpscr }) {
//        if (r1 != 0x0) {
//            arg_38 = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_38 = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        r0 = sub_e08430();
//        r0 << 0x10 | r0;
//        arg_2C = 0x0;
//        r0 = 0x1;
//    }
//    else {
//        if (r1 != 0x0) {
//            arg_38 = r1;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_38 = 0x0;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        r0 = sub_e0842c();
//        r0 << 0x10 | r0;
//        r0 = 0x0;
//        arg_2C = 0x1;
//    }
//    asm{ vsub.f32   d8, d8, d16 };
//    arg_30 = r0;
//    arg_34 = 0x1;
//    arg_28 = 0x1;
//    goto loc_d8252e;
//    
//loc_d823c4:
//    arg_34 = 0x1;
//    goto loc_d823c8;
//    
//loc_d8142a:
//    loc_e08118(r5, 0x29b7c98);
//    r4 = sub_e08128();
//    loc_e08118(r4, @selector(albumView));
//    r6 = sub_e08128();
//    r0 = loc_e08118(@class(ComHelper), @selector(angleAtPresentationFromView:), r6);
//    loc_e08118(r5, @selector(setAngle:), r0);
//    loc_e08110(r6);
//    loc_e08110(r4);
//    loc_e08118(r5, 0x29b7c98);
//    r4 = sub_e08128();
//    loc_e08118(r4, @selector(stopAlbumRotation));
//    loc_e08110(r4);
//    arg_7C = @selector(albumViewFrame);
//    loc_e08138();
//    arg_80 = @selector(getCenterByRect:);
//    asm{ ldrd       r3, r0, [sp, #0x18 + arg_268] };
//    asm{ ldrd       r1, r6, [sp, #0x18 + arg_270] };
//    asm{ stm.w      sp, {r0, r1, r6} };
//    loc_e08138();
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_278] };
//    arg_58 = @selector(valueWithCGPoint:);
//    loc_e08118(@class(NSValue), @selector(valueWithCGPoint:));
//    r0 = sub_e08128();
//    arg_78 = r0;
//    r4 = @class(NSValue);
//    r10 = @selector(sharedApplication);
//    loc_e08118(*0x29b7c98, r10);
//    r7 = r7;
//    arg_5C = sub_e08128();
//    if ((loc_e08118() & 0xff) == 0x0) goto loc_d8157a;
//    
//loc_d8156a:
//    arg_8C = r5;
//    arg_4C = 0x0;
//    arg_38 = 0x0;
//    arg_40 = 0x0;
//    arg_74 = r11;
//    goto loc_d81630;
//    
//loc_d81630:
//    r0 = loc_e08118(@class(SkinAutoSize), @selector(screenHeight), 0x29b8d78);
//    r0 << 0x10 | r0;
//    r6 = 0x0;
//    arg_3C = r0;
//    r10 = 0x0;
//    arg_54 = r0;
//    arg_50 = r0;
//    arg_44 = 0x0;
//    goto loc_d81780;
//    
//loc_d81780:
//    asm{ vmov.f32   d17, #0xffffffff };
//    asm{ vadd.f32   d0, d16, d17 };
//    loc_e08118(r4, arg_58, 0x41b00000, s0);
//    r5 = sub_e08128();
//    r11 = arg_8C;
//    arg_48 = @selector(miniPlayerAlbumViewFrame);
//    loc_e08138();
//    asm{ ldrd       r3, r0, [sp, #0x18 + arg_210] };
//    asm{ ldrd       r1, r2, [sp, #0x18 + arg_218] };
//    asm{ stm.w      sp, {r0, r1, r2} };
//    loc_e08138();
//    asm{ ldrd       r2, r3, [sp, #0x18 + arg_220] };
//    loc_e08118(@class(NSValue), arg_58);
//    r4 = sub_e08128();
//    loc_e08118(@class(NSArray), arg_64, sp + 0x2d8, 0x3);
//    r7 = r7;
//    arg_80 = sub_e08128();
//    loc_e08110(r4);
//    loc_e08110(r5);
//    r4 = arg_50;
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    if (CPU_FLAGS & E) {
//        loc_e08110();
//    }
//    COND = r6 != 0x1;
//    r6 = r11;
//    if (!COND) {
//        loc_e08110();
//        loc_e08110(arg_3C);
//    }
//    if (arg_4C == 0x1) {
//        loc_e08110(arg_40);
//        loc_e08110(arg_38);
//    }
//    loc_e08110(arg_5C);
//    loc_e08110(arg_78);
//    loc_e08118(@class(NSNumber), arg_74, 0x3f800000);
//    r0 = sub_e08128();
//    arg_78 = r0;
//    loc_e08138();
//    asm{ vdiv.f32   s0, s0, s2 };
//    loc_e08118(@class(NSNumber), arg_74, 0x42100000);
//    r0 = sub_e08128();
//    r10 = r0;
//    loc_e08138();
//    loc_e08138();
//    asm{ vdiv.f32   s0, s18, s0 };
//    loc_e08118(@class(NSNumber), arg_74, arg_1EC);
//    r6 = sub_e08128();
//    loc_e08118(@class(NSArray), arg_64, sp + 0x2cc, 0x3);
//    arg_7C = sub_e08128();
//    loc_e08110(r6);
//    loc_e08110(r10);
//    loc_e08110(arg_78);
//    loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"position");
//    r10 = sub_e08128();
//    arg_78 = r10;
//    loc_e08118(r10, @selector(setValues:), arg_80);
//    loc_e08118(r10, @selector(setKeyTimes:), arg_88);
//    loc_e08118(@class(CAKeyframeAnimation), @selector(animationWithKeyPath:), @"transform.scale");
//    r0 = sub_e08128();
//    arg_74 = r0;
//    r11 = r0;
//    loc_e08118();
//    loc_e08118(r11, @selector(setKeyTimes:), arg_88);
//    loc_e08118(@class(CAAnimationGroup), @selector(animation));
//    r5 = sub_e08128();
//    arg_5C = r5;
//    asm{ strd       sl, r4, [sp, #0x18 + arg_2A4] };
//    loc_e08118(@class(NSArray), arg_64, sp + 0x2c4, 0x2);
//    r4 = sub_e08128();
//    loc_e08118(r5, @selector(setAnimations:), r4);
//    loc_e08110(r4);
//    r10 = r5;
//    loc_e08118(r5, @selector(setDuration:), d8 & 0xffff, d8 >> 0x10);
//    loc_e08118(arg_8C, arg_70);
//    r4 = sub_e08128();
//    loc_e08118(r4, @selector(albumBaseView));
//    r5 = sub_e08128();
//    loc_e08118(r5, @selector(layer));
//    r6 = sub_e08128();
//    loc_e08118(r6, @selector(addAnimation:forKey:), r10, @"group");
//    loc_e08110(r6);
//    loc_e08110(r5);
//    loc_e08110(r4);
//    loc_e08118(@class(CABasicAnimation), @selector(animationWithKeyPath:), @"opacity");
//    r4 = sub_e08128();
//    loc_e08118(*0x29b7c1c, @selector(numberWithDouble:), 0x9999999a & 0xffff, 0x9999999a >> 0x10);
//    r5 = sub_e08128();
//    loc_e08118(r4, @selector(setFromValue:), r5);
//    loc_e08110(r5);
//    asm{ vmov.i32   d16, #0x0 };
//    loc_e08118(*0x29b7c1c, @selector(numberWithDouble:), 0x9999999a & 0xffff, 0x9999999a >> 0x10);
//    r5 = sub_e08128();
//    r6 = r4;
//    loc_e08118(r6, @selector(setToValue:), r5);
//    loc_e08110(r5);
//    loc_e08118(@class(CAAnimationGroup), @selector(animation));
//    r10 = sub_e08128();
//    arg_64 = @selector(arrayWithObjects:count:);
//    loc_e08118(@class(NSArray), @selector(arrayWithObjects:count:), sp + 0x1fc, 0x1);
//    r5 = sub_e08128();
//    loc_e08118(r10, @selector(setAnimations:), r5);
//    loc_e08110(r5);
//    asm{ ldrd       r2, r1, [sp, #0x18 + arg_48] };
//    loc_e08118(r10);
//    loc_e08118(arg_8C, arg_70);
//    r5 = sub_e08128();
//    loc_e08118(r5, @selector(albumViewBorder));
//    r0 = sub_e08128();
//    r4 = r0;
//    loc_e08118();
//    r7 = r7;
//    r0 = sub_e08128();
//    r8 = r0;
//    loc_e08118();
//    loc_e08110(r8);
//    loc_e08110(r4);
//    r0 = r5;
//    r5 = @selector(numberWithDouble:);
//    loc_e08110(r0);
//    loc_e08110(r10);
//    loc_e08110(r6);
//    loc_e08110(arg_5C);
//    loc_e08110(arg_74);
//    loc_e08110(arg_78);
//    loc_e08110(arg_7C);
//    goto loc_d81c58;
//    
//loc_d8157a:
//    loc_e08118(@class(UIDevice), @selector(currentDevice), 0x29b7ce8);
//    arg_38 = sub_e08128();
//    loc_e08118();
//    r7 = r7;
//    arg_40 = sub_e08128();
//    r0 = loc_e08118();
//    asm{ vmov.f32   d0, #0x7 };
//    arg_74 = r11;
//    r0 << 0x10 | r0;
//    asm{ vcmpe.f32  s2, s0 };
//    if (asm{ vmrs       APSR_nzcv, fpscr }) goto loc_d8162a;
//    
//loc_d815dc:
//    r11 = r4;
//    r4 = loc_e08118(@class(SkinAutoSize), @selector(screenHeight), 0x29b8d78);
//    loc_e08118(*0x29b7c98, r10);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        arg_3C = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        arg_3C = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 << 0x10 | r4;
//    r0 = sub_e08430();
//    r0 << 0x10 | r0;
//    loc_e08118(*0x29b7c98, r10);
//    r7 = r7;
//    r1 = sub_e08128();
//    if (r1 != 0x0) {
//        arg_54 = r1;
//        loc_e08138();
//        asm{ ldm        r3, {r0, r1, r2, r3} };
//    }
//    else {
//        asm{ vmov.i32   q8, #0x0 };
//        arg_54 = 0x0;
//        asm{ vst1.64    {d16, d17}, [r0] };
//    }
//    r4 = r11;
//    r0 = sub_e0842c();
//    r0 << 0x10 | r0;
//    loc_e08118(*0x29b7c98, r10);
//    r7 = r7;
//    r6 = sub_e08128();
//    asm{ vcmpe.f32  s20, s22 };
//    if (!asm{ vmrs       APSR_nzcv, fpscr }) {
//        if (r6 != 0x0) {
//            arg_8C = r5;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_8C = r5;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        arg_50 = r6;
//        r0 = sub_e08430();
//        r0 << 0x10 | r0;
//        r10 = 0x0;
//        r0 = 0x1;
//    }
//    else {
//        if (r6 != 0x0) {
//            arg_8C = r5;
//            loc_e08138();
//            asm{ ldm        r3, {r0, r1, r2, r3} };
//        }
//        else {
//            asm{ vmov.i32   q8, #0x0 };
//            arg_8C = r5;
//            asm{ vst1.64    {d16, d17}, [r0] };
//        }
//        arg_50 = r6;
//        r0 = sub_e0842c();
//        r0 << 0x10 | r0;
//        r10 = 0x1;
//        r0 = 0x0;
//    }
//    asm{ vsub.f32   d16, d9, d16 };
//    arg_44 = r0;
//    r6 = 0x1;
//    arg_4C = 0x1;
//    goto loc_d81780;
//    
//loc_d8162a:
//    arg_8C = r5;
//    arg_4C = 0x1;
//    goto loc_d81630;
//    
//loc_d8140c:
//    arg_8C = r10;
//    r5 = @selector(numberWithDouble:);
//    goto loc_d81c5c;
//}
//
//- (void)animationdidstop
//{
//    r4 = self;
//    loc_e08118(arg2, @selector(valueForKey:), @"myAnimationId", @"myAnimationId", var_14, var_10, var_C, var_8, var_4, saved_r7, saved_lr);
//    r7 = sp + 0xc;
//    r8 = sub_e08128();
//    loc_e08118(r4, @selector(setIsPlayingViewAnimating:), 0x0);
//    r2 = @"returnMiniPlayer";
//    r5 = @selector(isEqual:);
//    if ((loc_e08118(r8, r5, r2) & 0xff) == 0x0) goto loc_d84ce0;
//    
//loc_d84cd4:
//    r0 = @selector(didFinishReturnMiniControllerAnimation);
//    goto loc_d84d26;
//    
//loc_d84d26:
//    loc_e08118(r4, *r0);
//    goto loc_d84d2e;
//    
//loc_d84d2e:
//    r1 = @selector(needUpdateAlbumImageOnPlayingViewOpen);
//    asm{ uxtb       r0, r0 };
//    if (loc_e08118(r4, r1) == 0x1) {
//        loc_e08118(r4, @selector(stayUpdateImage));
//        r6 = sub_e08128();
//        loc_e08118(r4, @selector(updateAlbumImageView:), r6);
//        loc_e08110(r6);
//        loc_e08118(@class(QMMiniPlayerController), @selector(sharedMiniPlayerController), 0x29b8df4);
//        r10 = sub_e08128();
//        loc_e08118(r4, @selector(stayUpdateImage));
//        r5 = sub_e08128();
//        loc_e08118(r4, @selector(curPlaySong));
//        r6 = sub_e08128();
//        loc_e08118(r10, @selector(cropAndUpdateImage:forSong:), r5, r6);
//        loc_e08110(r6);
//        loc_e08110(r5);
//        loc_e08110(r10);
//        loc_e08118(r4, @selector(setStayUpdateImage:), 0x0);
//        r2 = 0x0;
//        r1 = @selector(setNeedUpdateAlbumImageOnPlayingViewOpen:);
//        loc_e08118(r4, r1, r2);
//    }
//    r0 = loc_e0812c();
//    loc_1c09734(r0, r1, r2);
//    return;
//    
//loc_d84ce0:
//    r2 = @"updateAblum";
//    if ((loc_e08118(r8, r5, r2) & 0xff) == 0x0) goto loc_d84d04;
//    
//loc_d84cf8:
//    r0 = @selector(didFinishUpdateAlbumAnimation);
//    goto loc_d84d26;
//    
//loc_d84d04:
//    r2 = @"showPlayingView";
//    if ((loc_e08118(r8, r5, r2) & 0xff) == 0x0) goto loc_d84d2e;
//    
//loc_d84d1c:
//    r0 = @selector(didFinishShowPlayingViewAnimation);
//    goto loc_d84d26;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
