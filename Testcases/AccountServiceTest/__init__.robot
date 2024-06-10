*** Settings ***
Library  AppiumLibrary
Library    String
Library    AppiumLibrary
Library    OperatingSystem
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Suite Setup     Start Equity Application
Test Setup      Test Setup