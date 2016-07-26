# CHCustomAlertView
自定义alertview，自动根据iOS系统选择UIAlertView或UIAlertController

使用方法：
@implementation ViewController
{
    CHAlertView *alertview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    alertview  = [CHAlertView createAlertViewWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"other1",@"other2",nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [CHAlertView show:alertview Controller:self];
    
}
