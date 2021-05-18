*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${SERVER}         itshopsegdesa.redlink.com.ar
${SERVERAUTH}     itshopsegdesa.redlink.com.ar:3000
${BROWSER}        Chrome
${DELAY}          10
${VALID USER}     SIR_AUTO_TEC
${VALID PASSWORD}    t3WhpGdUkSGu6EnewF 
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    https://${SERVER}/home
${ERROR URL}      https://${SERVER}/error.html
${ERROR MESSAGE}    Error de autenticación (inicio de sesión o desafío). Inténte nuevamente o contacte con el administrador del sistema.

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Red Link Secure Authentication System

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    name:user    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name:password    ${password}

Next Credentials
    Click Button    //button[@type='submit']

Submit Credentials
    Click Button    //button[@type='submit']

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Auto Security Service
