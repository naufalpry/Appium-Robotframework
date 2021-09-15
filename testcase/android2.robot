*** Settings ***
Library         AppiumLibrary     run_on_failure=Capture Page Screenshot
Library         String
Library         BuiltIn

** Variable **
${appium_host}=  http://0.0.0.0:4723/wd/hub
${platform_name}=    Android
${platformVersion}=     8.1
# ${app}=      	/Users/naufalpry/Downloads/yummy.apk
${deviceName}=     emulator:5554
${apppackage}=       com.yummycorp.yummyshop.sit
${appactivity}=         com.yummycorp.yummyshop.MainActivity
${login}=               pamanbaik@getnada.com
*** Test Cases ***
Login
    [Documentation]    Test case robotframework with appium
    Open Application       ${appium_host}    platformName=${platform_name}        deviceName=${deviceName}      platformVersion=${platformVersion}      appPackage=${apppackage}      appActivity=${appactivity}
    Wait Until Page Contains Element            //android.view.ViewGroup[@content-desc="btnLogin"]     10s   
    Click Element                               //android.view.ViewGroup[@content-desc="btnLogin"]
    Wait Until Page Contains Element            //android.widget.EditText[@content-desc="fieldLogin"]      10s   
    Input Text                                  //android.widget.EditText[@content-desc="fieldLogin"]               ${Login}
    Click Element                               //android.view.ViewGroup[@content-desc="continueLogin"]
    Wait Until Page Contains Element            //android.widget.EditText[@content-desc="verifyPin1"]
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin1"]       0
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin2"]       0
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin3"]       0
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin4"]       0
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin5"]       0
    Input Text                                  //android.widget.EditText[@content-desc="verifyPin6"]       0
    Sleep    3s
    Capture Page Screenshot
    Wait Until Page Contains Element           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]          15s
    Click Element                              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1] 
Product
    Wait Until Page Contains Element            //android.view.ViewGroup[@content-desc="addProduct"]     10s
    Click Element                               //android.view.ViewGroup[@content-desc="addProduct"]
    Wait Until Page Contains Element            //android.widget.EditText[@content-desc="productName"]      10s
    Input Text                                  //android.widget.EditText[@content-desc="productName"]      es kelapa
    Input Text                                  //android.widget.EditText[@text="Deskripsi Produk"]     Kelapa muda
    Swipe                                       0   1000     0       0
    Wait Until Page Contains Element            //android.widget.TextView[@text="Simpan Produk"]        10s
    Input Text                                  //android.widget.EditText[@content-desc="productPrice"]     10000
    Click Element                               //android.view.ViewGroup[@content-desc="productCategory"]
    Wait Until Page Contains Element            //android.widget.TextView[@text="Minuman"]    10s
    Click Element                               //android.widget.TextView[@text="Minuman"]
    Click Element                               //android.view.ViewGroup[@content-desc="setCategory"]
    Wait Until Page Contains Element            //android.view.ViewGroup[@content-desc="btnSimpanProduk"]           10s
    Click Element                               //android.view.ViewGroup[@content-desc="btnSimpanProduk"]
    # Element Attribute Should Match
    Capture Page Screenshot
    Sleep   3s