//
//  KIFUITestActor+Login.m
//  Blockchain
//
//  Created by Kevin Wu on 4/14/16.
//  Copyright © 2016 Qkos Services Ltd. All rights reserved.
//

#import "KIFUITestActor+Login.h"
#import "Blockchain-Prefix.pch"
#import "RootService.h"
#import "SettingsTableViewController.h"

// 5s simulator
const CGPoint pinKeyTwo = (CGPoint){154, 362};

@implementation KIFUITestActor (Login)

#pragma mar - Addresses

- (void)goToAddresses
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_ADDRESSES];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_ADDRESSES];
}

- (void)createAccount
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_NEW_ACCOUNT];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_NEW_ACCOUNT];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_TEXT_FIELD_CREATE_ACCOUNT];
    [self enterText:@"ϓ␀𐐀💩" intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_TEXT_FIELD_CREATE_ACCOUNT];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_BUTTON_CREATE_ACCOUNT];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_BUTTON];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_BUTTON];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
}

#pragma mark - Backup

- (void)backupFromSideMenu
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_BACKUP];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_BACKUP];
    
    [self waitForTappableViewWithAccessibilityLabel:@"goToBackupWords"];
    [self tapViewWithAccessibilityLabel:@"goToBackupWords"];
    
    [self waitForTappableViewWithAccessibilityLabel:@"nextWord"];
    
    for (int i = 0; i < 12; i++) {
        [self tapViewWithAccessibilityLabel:@"nextWord"];
    }
    
    NSArray *words = [app.wallet.recoveryPhrase componentsSeparatedByString:@" "];
    
    NSArray *indexes = @[NSLocalizedString(@"first word", comment:""),
                              NSLocalizedString(@"second word", comment:""),
                              NSLocalizedString(@"third word", comment:""),
                              NSLocalizedString(@"fourth word", comment:""),
                              NSLocalizedString(@"fifth word", comment:""),
                              NSLocalizedString(@"sixth word", comment:""),
                              NSLocalizedString(@"seventh word", comment:""),
                              NSLocalizedString(@"eighth word", comment:""),
                              NSLocalizedString(@"ninth word", comment:""),
                              NSLocalizedString(@"tenth word", comment:""),
                              NSLocalizedString(@"eleventh word", comment:""),
                              NSLocalizedString(@"twelfth word", comment:"")];
    
    UITextField *word1 = (UITextField *)[self waitForTappableViewWithAccessibilityLabel:@"verifyWord1"];
    UITextField *word2 = (UITextField *)[self waitForTappableViewWithAccessibilityLabel:@"verifyWord2"];
    UITextField *word3 = (UITextField *)[self waitForTappableViewWithAccessibilityLabel:@"verifyWord3"];
    
    NSArray *textFields = @[word1, word2, word3];
    
    [self waitForTimeInterval:2];
    
    for (UITextField *textField in textFields) {
        NSInteger index = [indexes indexOfObject:textField.placeholder];
        NSString *word = [words objectAtIndex:index];
        [self enterText:word intoViewWithAccessibilityLabel:textField.accessibilityLabel];
    }
    
    [self tapViewWithAccessibilityLabel:@"verifyWords"];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_BUTTON];
}

- (void)closeSideMenuNavigationController
{
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_BUTTON];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
}

#pragma mark - Login

- (void)manualPairWithGUID:(NSString *)guid password:(NSString *)password
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_LOG_IN];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_LOG_IN];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR_FIELD_GUID];
    [self enterText:guid intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR_FIELD_GUID];
    [self enterText:password intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR_FIELD_PASSWORD];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR_CONTINUE];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MANUAL_PAIR_CONTINUE];
    
    [self setupPIN];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
}

- (void)setupPIN
{
    [self waitForViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_NUMPAD_VIEW];
    [self enterPIN];
    [self waitForTimeInterval:.2];
    [self enterPIN];
}

- (void)createNewWallet
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CREATE_NEW_WALLET];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CREATE_NEW_WALLET];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    
    [self waitForTimeInterval:8];
    [self tapViewWithAccessibilityLabel:BC_STRING_OK traits:UIAccessibilityTraitButton];
    
    [self setupPIN];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_TOUCH_ID_REMINDER_BUTTON];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_TOUCH_ID_REMINDER_BUTTON];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_EMAIL_REMINDER_BUTTON];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CLOSE_EMAIL_REMINDER_BUTTON];

    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
}

- (void)recoverWalletWithPhrase:(NSString *)phrase
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECOVER_WALLET];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECOVER_WALLET];
    
    [self waitForTappableViewWithAccessibilityLabel:BC_STRING_CONTINUE];
    [self tapViewWithAccessibilityLabel:BC_STRING_CONTINUE];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECOVER_WALLET_FIELD];
    [self enterText:phrase intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECOVER_WALLET_FIELD];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_NUMPAD_VIEW];
    [self setupPIN];
}

- (void)enterPIN
{
    [self waitForViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_NUMPAD_VIEW];
    
    [self tapScreenAtPoint:pinKeyTwo];
    [self tapScreenAtPoint:pinKeyTwo];
    [self tapScreenAtPoint:pinKeyTwo];
    [self tapScreenAtPoint:pinKeyTwo];
}

- (void)logoutAndForgetWallet
{
    [self logout];
    
    [self forgetWallet];
}

- (void)logout
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_LOGOUT];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_LOGOUT];
    
    [self waitForTimeInterval:.2];
    [self tapViewWithAccessibilityLabel:BC_STRING_OK traits:UIAccessibilityTraitButton];
}

- (void)forgetWallet
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FORGET_WALLET];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FORGET_WALLET];
    
    [self waitForTimeInterval:.2];
    [self tapViewWithAccessibilityLabel:BC_STRING_FORGET_WALLET traits:UIAccessibilityTraitButton];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CREATE_NEW_WALLET];
}

#pragma mark - Send

- (void)send
{
    [self goToSend];
    [self typeInAddress];
    
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SEND_FIAT_FIELD];
    [self enterTextIntoCurrentFirstResponder:@"0.10"];
    [self waitForAnimationsToFinish];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE_PAYMENT];
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONFIRM_PAYMENT];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONFIRM_PAYMENT];
}

- (void)goToSend
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SEND_TAB];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SEND_TAB];
}

- (void)typeInAddress
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SELECT_ADDRESS];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SELECT_ADDRESS];
    [self enterTextIntoCurrentFirstResponder:@"1MdLTHM5xTNuu7D12fyce5MqtchnRmuijq"];
}

// No decimal

- (void)confirmSendAmountNoDecimal
{
    [self confirmSendAmountWithText:@"1"];
}

- (void)confirmSendAmountArabicNumeralsNoDecimal
{
    [self confirmSendAmountWithText:@"١"];
}

// Period separator

- (void)confirmSendAmountDecimalPeriodDecimalFirst
{
    [self confirmSendAmountWithText:@".10"];
}

- (void)confirmSendAmountDecimalPeriodZeroThenDecimal
{
    [self confirmSendAmountWithText:@"0.10"];
}

- (void)confirmSendAmountDecimalPeriodNumberThenDecimal
{
    [self confirmSendAmountWithText:@"1.10"];
}

- (void)confirmSendAmountDecimalPeriodArabicTextNoDecimal
{
    [self confirmSendAmountWithText:@"١"];
}

- (void)confirmSendAmountDecimalPeriodArabicTextDecimalFirst
{
    [self confirmSendAmountWithText:@".١٠"];
}

- (void)confirmSendAmountDecimalPeriodArabicTextZeroThenDecimal
{
    [self confirmSendAmountWithText:@"٠.١٠"];
}

- (void)confirmSendAmountDecimalPeriodArabicTextNumberThenDecimal
{
    [self confirmSendAmountWithText:@"١.١٠"];
}

// Comma separator

- (void)confirmSendAmountDecimalCommaDecimalFirst
{
    [self confirmSendAmountWithText:@",10"];
}

- (void)confirmSendAmountDecimalCommaZeroThenDecimal
{
    [self confirmSendAmountWithText:@"0,10"];
}

- (void)confirmSendAmountDecimalCommaNumberThenDecimal
{
    [self confirmSendAmountWithText:@"1,10"];
}

- (void)confirmSendAmountDecimalCommaArabicTextDecimalFirst
{
    [self confirmSendAmountWithText:@",١٠"];
}

- (void)confirmSendAmountDecimalCommaArabicTextZeroThenDecimal
{
    [self confirmSendAmountWithText:@"٠,١٠"];
}

- (void)confirmSendAmountDecimalCommaArabicTextNumberThenDecimal
{
    [self confirmSendAmountWithText:@"١,١٠"];
}

// Arabic Comma separator

- (void)confirmSendAmountDecimalArabicCommaDecimalFirst
{
    [self confirmSendAmountWithText:@"٫10"];
}

- (void)confirmSendAmountDecimalArabicCommaZeroThenDecimal
{
    [self confirmSendAmountWithText:@"0٫10"];
}

- (void)confirmSendAmountDecimalArabicCommaNumberThenDecimal
{
    [self confirmSendAmountWithText:@"1٫10"];
}

- (void)confirmSendAmountDecimalArabicCommaAndTextDecimalFirst
{
    [self confirmSendAmountWithText:@"٫١٠"];
}

- (void)confirmSendAmountDecimalArabicCommaAndTextZeroThenDecimal
{
    [self confirmSendAmountWithText:@"٠٫١٠"];
}

- (void)confirmSendAmountDecimalArabicCommaAndTextNumberThenDecimal
{
    [self confirmSendAmountWithText:@"١٫١٠"];
}

- (void)confirmSendAmountWithText:(NSString *)text
{
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SEND_FIAT_FIELD];
    [self enterTextIntoCurrentFirstResponder:text];
    [self waitForAnimationsToFinish];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE_PAYMENT];
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MODAL_BACK_CHEVRON];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_MODAL_BACK_CHEVRON];
    [self clearTextFromViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SEND_FIAT_FIELD];
}

#pragma mark - Receive

- (void)goToReceive
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECEIVE_TAB];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECEIVE_TAB];
}

- (uint64_t)confirmReceiveAmount:(NSString *)randomAmount
{
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECEIVE_FIAT_FIELD];
    [self clearTextFromViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECEIVE_FIAT_FIELD_INPUT_ACCESSORY];
    [self enterTextIntoCurrentFirstResponder:randomAmount];
    [self waitForAnimationsToFinish];
    
    UITextField *textField = (UITextField *)[self waitForViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_RECEIVE_FIAT_FIELD];
    return [app.wallet parseBitcoinValueFromTextField:textField];
}

- (uint64_t)computeBitcoinValue:(NSString *)amount
{
    return [app.wallet parseBitcoinValueFromString:amount];
}

#pragma mark - Settings

- (void)goToSettings
{
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    
    [self waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_SETTINGS];
    [self tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CELL_SETTINGS];
}

- (void)changePassword:(NSString *)newPassword
{
    if ([app.settingsNavigationController.visibleViewController isMemberOfClass:[SettingsTableViewController class]]) {
        SettingsTableViewController *tableViewController = (SettingsTableViewController *)app.settingsNavigationController.visibleViewController;
        
        NSIndexPath *indexPath = [tableViewController indexPathForChangePassword];
        
        [tableViewController.tableView scrollToRowAtIndexPath:[tableViewController indexPathForChangePassword] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        [tester tapRowAtIndexPath:indexPath inTableView:tableViewController.tableView];
        
        [tester waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FIELD_OLD_PASSWORD];
        [tester enterText:@"testpassword!" intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FIELD_OLD_PASSWORD];
        [tester enterText:newPassword intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FIELD_NEW_PASSWORD];
        [tester enterText:newPassword intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_FIELD_CONFIRM_NEW_PASSWORD];
        [tester tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_CONTINUE];
        
        [tester waitForTappableViewWithAccessibilityLabel:BC_STRING_OK];
        [tester tapViewWithAccessibilityLabel:BC_STRING_OK];
        
        [tester waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_ENTER_PASSWORD_FIELD];
        [tester enterText:newPassword intoViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_ENTER_PASSWORD_FIELD];
        [tester tapViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_ENTER_PASSWORD_BUTTON];
        
        [tester setupPIN];
        
        [tester waitForTappableViewWithAccessibilityLabel:ACCESSIBILITY_LABEL_SIDE_MENU];
    }
}

@end