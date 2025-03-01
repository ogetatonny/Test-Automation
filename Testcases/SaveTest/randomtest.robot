*** Settings ***
Library    DateTime

*** Test Cases ***
Get Today's Date
    #${today}    Get Current Date    result_format=%Y-%m-%d
    ${todays_date}    Get Current Date
    ${todays_formatted_date}     convert date    ${todays_date}    result_format=%A, %B %d
    log to console    Today's date is: ${todays_formatted_date}

    ${tomorrows_date}     add time to date    ${todays_date}     1 day
    ${tomorrows_formatted_date}    convert date    ${tomorrows_date}    result_format=%A, %B %d
    log to console    tomorrow's date is: ${tomorrows_formatted_date}

