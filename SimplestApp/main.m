//
//  main.m
//  SimplestApp
//
//  Created by Aditya Narayan on 1/14/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyView : UIView
@end
@implementation MyView

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // How can I get this to show up even when the button is touched?
    NSLog(@"%@", [touches anyObject]);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest called");
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"pointInside called");
    return [super pointInside:point withEvent:event];
}

@end

@interface TestViewAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
}

@property (nonatomic, strong) UIViewController* viewController;
@property (nonatomic, strong) UIView* rectangle1;
@property (nonatomic, strong) UIView* rectangle2;
@property (nonatomic, strong) UIView* rectangle3;
@property (nonatomic, strong) UIView* rectangle4;
@property (nonatomic, strong) UIView* rectangle5;
@property (nonatomic, strong) MyView* view;
@property (nonatomic, strong) UITextField* textField1;
@property (nonatomic, strong) UITextField* textField2;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIAlertController* alert;


@end

@implementation TestViewAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = [[MyView alloc] initWithFrame:[window frame]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.viewController = [[UIViewController alloc]init];
    self.viewController.view = self.view;
    [window setRootViewController:self.viewController];
    [window makeKeyAndVisible];
    
 //tap
    self.rectangle1 = [[UIView alloc]initWithFrame:CGRectMake(30, 30 , 70, 70)];
    [self.view addSubview:self.rectangle1];
    self.rectangle1.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *rectangle1Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMethod:)];
    [self.rectangle1 addGestureRecognizer:(rectangle1Tap)];
//pinch
    self.rectangle2 = [[UIView alloc]initWithFrame:CGRectMake(120, 30, 70, 70)];
    [self.view addSubview:_rectangle2];
    self.rectangle2.backgroundColor = [UIColor blueColor];
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchMethod:)];
    [self.rectangle2 addGestureRecognizer:pinchRecognizer];
//pan
    self.rectangle3 = [[UIView alloc]initWithFrame:CGRectMake(210, 30, 70, 70)];
    [self.view addSubview:self.rectangle3];
    self.rectangle3.backgroundColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:1.0];
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMethod:)];
    [self.rectangle3 addGestureRecognizer:panRecognizer];
// swipe
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeMethod:)];
    [self.view addGestureRecognizer:swipeRecognizer];
// rotate
    self.rectangle4 = [[UIView alloc]initWithFrame:CGRectMake(30, 120, 70, 70)];
    [self.view addSubview:_rectangle4];
    self.rectangle4.backgroundColor = [UIColor blueColor];
    UIRotationGestureRecognizer *rotateGestureRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateMethod:)];
    [self.rectangle4 addGestureRecognizer:rotateGestureRecognizer];
// longpress
    self.rectangle5 = [[UIView alloc]initWithFrame:CGRectMake(120, 120, 70, 70)];
    [self.view addSubview:self.rectangle5];
    self.rectangle5.backgroundColor = [UIColor blueColor];
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressMethod:)];
    [self.rectangle5 addGestureRecognizer:longPressRecognizer];
    
//text field
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(30, 220, 100, 50)];
    self.textField1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.textField1];
    
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(150, 220, 100, 50)];
    self.textField2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.textField2];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(75, 320, 100, 50)];
    self.label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.label];
    
   
    
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(75, 400, 100, 50)];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    
    
}

//tap gesture recognizer
-(void) tapMethod: (UITapGestureRecognizer*) sender
{
    
    NSLog(@"Tap resture recoginzed");
    float redColor = arc4random() % 255/255.0;
    float greenColor = arc4random() % 255/255.0;
    float blueColor = arc4random() % 255/255.0;
    self.rectangle1.backgroundColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0];
    
}

//pinch gesture recognizer
-(void) pinchMethod: (UIPinchGestureRecognizer*) sender
{
    self.rectangle2.transform = CGAffineTransformScale(self.rectangle2.transform, sender.scale, sender.scale);
    sender.scale = 1.0;
}


- (void)dealloc
{
    [window release];
    [super dealloc];
}
//pan gesture recognizer
-(void) panMethod:(UIPanGestureRecognizer*) sender
{
    CGPoint touchLocation = [sender locationInView: self.view];
    self.rectangle3.center = touchLocation;
}
//swipe gesture recognizer
-(void) swipeMethod: (UISwipeGestureRecognizer*) sender
{
    NSInteger aRedValue = arc4random()%255;
    NSInteger aGreenValue = arc4random()%255;
    NSInteger aBlueValue = arc4random()%255;
    
    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
    
    self.view.backgroundColor = randColor;
}
//rotate gesture recognizer
-(void) rotateMethod: (UIRotationGestureRecognizer*) sender
{
    self.rectangle4.transform = CGAffineTransformRotate(self.rectangle4.transform, sender.rotation);
    sender.rotation = 0.0;
}

//long press method
-(void) longPressMethod: (UILongPressGestureRecognizer*) sender
{
    float redColor = arc4random() % 255/255.0;
    float greenColor = arc4random() % 255/255.0;
    float blueColor = arc4random() % 255/255.0;
    self.rectangle5.backgroundColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0];
}

//button pressed
-(void) buttonPressed
{
    NSInteger firstNumber = [self.textField1.text integerValue];
    NSInteger secondNumber = [self.textField2.text integerValue];
    NSInteger result = firstNumber + secondNumber;
    self.label.text = [NSString stringWithFormat:@"%ld",(long)result];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result"
                                                    message:[NSString stringWithFormat:@"%ld",(long)result]                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TestViewAppDelegate class]));
    }
}
