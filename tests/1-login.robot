*** Settings ***
Documentation  A test suite with a single test for valid login.
Library  ../resources/ChromeDriverProvider.py
Library  Selenium2Library
Test Teardown  Close All Browsers

*** Variables ***
${App URL}  https://rwa.railflow.io
${Login URL}  ${App URL}/signin
${Login button}  xpath=//*[@id="root"]/div/main/div[1]/form/button
${Login name}  xpath=//*[@id="root"]/div/div/div/div[1]/div[2]/h6[2]
${Error}  xpath=//*[@id="root"]/div/main/div[1]/div[1]/div[2]

*** Test Cases ***
Valid Login
  [Tags]  testrail.id=C1825  testrail.id=C1826
  Open Browser To Login Page
  Input Text  username  Katharina_Bernier
  Input Text  password  s3cret
  Click Log in
  Welcome Page Should Be Open
  
Invalid Login
  Open Browser To Login Page  
  Input Text  username  Katharina_Bernier
  Input Text  password  whatever
  Click Log in
  Error Message Should Be Displayed

*** Keywords ***
Open Browser To Login Page
  ${DRIVER_PATH}  Get Chromedriver Path
  Open Browser  ${LOGIN URL}  Chrome  executable_path=${DRIVER_PATH}
  Maximize Browser Window
  Wait Until Page Contains Element  ${Login button}  5s

Click Log in
  Click Element  ${Login button}

Welcome Page Should Be Open    
  Wait Until Location Is  ${App URL}  5s  
  Wait Until Page Contains Element   ${Login name}  5s
  ${name}  Get Text  ${Login name}
  Should Be Equal As Strings  ${name}  @Katharina_Bernier  
  
Error Message Should Be Displayed
    Wait Until Location Is  ${Login URL}  5s
    Wait Until Page Contains Element  ${Error}  5s        
    ${error message}  Get Text  ${Error}
    Should Be Equal As Strings  ${error message}  Username or password is invalid  