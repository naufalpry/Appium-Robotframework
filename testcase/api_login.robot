***Settings***					
Library         RequestsLibrary
Library         String
Library         HttpLibrary.HTTP
Library         Collections
| Variables | ../setting.py



***Keyword***
Login    
    ${json_string}=    catenate
    ...  {
    ...    "params": {
    ...            "login": "${login}",
    ...            "password": "${password}",
    ...            "db":"${db}"
    ...          }
    ...  }

    log to console       \nOriginal JSON:\n${json_string}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json["params"]}    login=${login}    password=${password}  db=${db}
    CreateSession        login       ${url_api}             verify=True
      
      
    ${header2}=          Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    login    /api/auth    json=${json}    headers=${header2}
    ${status}=  Set Variable    ${resp.status_code}
    Should Be Equal As Strings	${resp.status_code}      ${status}
    log          ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}      200	
    ${jsondata}=  To Json  ${resp.content}
    ${jsonrpc}=     Set Variable    ${jsondata}[jsonrpc]
    ${id}=     Set Variable    ${jsondata}[id]  
    ${result}=     Set Variable    ${jsondata}[result] 
    ${result_uid}=     Set Variable    ${jsondata}[result][uid]
    ${result_is_system}=    Set Variable    ${jsondata}[result][is_system]
    ${result_is_admin}=     Set Variable    ${jsondata}[result][is_admin]
    ${result_user_context}=     Set Variable    ${jsondata}[result][user_context]
    ${result_user_context_lang}=     Set Variable    ${jsondata}[result][user_context][lang]
    ${result_user_context_tz}=     Set Variable    ${jsondata}[result][user_context][tz]
    ${result_user_context_uid}=     Set Variable    ${jsondata}[result][user_context][uid]
    ${result_db}=     Set Variable    ${jsondata}[result][db]  
    ${result_server_version}=     Set Variable    ${jsondata}[result][server_version]  
    ${result_server_version_info}=     Set Variable    ${jsondata}[result][server_version_info]  
    ${result_name}=     Set Variable    ${jsondata}[result][name]
    ${result_username}=     Set Variable    ${jsondata}[result][username]
    ${result_partner_display_name}=     Set Variable    ${jsondata}[result][partner_display_name]
    ${result_company_id}=     Set Variable    ${jsondata}[result][company_id]
    ${result_partner_id}=     Set Variable    ${jsondata}[result][partner_id]
    ${result_web.base.url}=     Set Variable    ${jsondata}[result][web.base.url]
    ${result_user_companies}=     Set Variable    ${jsondata}[result][user_companies]
    ${user_companies_current_company}=  Set Variable    ${jsondata}[result][user_companies][current_company]
    ${user_companies_allowed_companies}=  Set Variable    ${jsondata}[result][user_companies][allowed_companies]
    ${result_currencies}=     Set Variable    ${jsondata}[result][currencies]
    ${result_currencies_1}=     Set Variable    ${jsondata}[result][currencies][1]
    ${result_currencies_1_symbol}=     Set Variable    ${jsondata}[result][currencies][1][symbol]
    ${result_currencies_1_position}=     Set Variable    ${jsondata}[result][currencies][1][position]
    ${result_currencies_1_digits}=     Set Variable    ${jsondata}[result][currencies][1][digits]
    ${result_currencies_12}=     Set Variable    ${jsondata}[result][currencies][12]
    ${result_currencies_12_symbol}=     Set Variable    ${jsondata}[result][currencies][12][symbol]
    ${result_currencies_12_position}=     Set Variable    ${jsondata}[result][currencies][12][position]
    ${result_currencies_12_digits}=     Set Variable    ${jsondata}[result][currencies][12][digits]
 
***Test Cases***
Yummy.Corp Login
    Login
    
