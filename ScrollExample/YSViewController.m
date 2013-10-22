//
//  YSViewController.m
//  ScrollExample
//
//  Created by Iain Huxley on 10/21/13.
//

#import "YSViewController.h"

@interface YSViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageBlurred;
@property (weak, nonatomic) IBOutlet UIImageView *horizGradientImage;
@property (weak, nonatomic) IBOutlet UIView *blackWashView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation YSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                             self.view.frame.size.height * 2.0);
    self.scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView*)sender
{
    // example effect - no effect at zero pixels, full at 140 pixels
    CGFloat effectAmount = sender.contentOffset.y / 140.0;
    
    //NSLog(@"effectAmount is %f", effectAmount);
    [self setBlurAndOtherEffects:MIN(1.0, MAX(0.0, effectAmount))];
}


// set blur of bg image, from 0 (no blur) to 1 (max)
- (void)setBlurAndOtherEffects:(CGFloat)amount
{
    self.backgroundImageBlurred.alpha = amount;
    
    // fade in black wash as blur amount increases
    self.blackWashView.alpha = amount * 0.5;
    
    // fade out bottom gradient as blur amount increases
    self.horizGradientImage.alpha = (1.0 - amount) * 0.9;
    
}
@end
