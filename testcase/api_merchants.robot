***Settings***					
Library         RequestsLibrary
Library         String
Library         HttpLibrary.HTTP
Library         Collections
| Variables | ../setting.py

***Keyword***
MerchantId    
    ${json_string}=    catenate
    ...  {
    ...    "params": {
    ...            	"MerchantId":"${MerchantId}"
    ...          }
    ...  }

    log to console       \nOriginal JSON:\n${json_string}
    ${json}=             evaluate        json.loads('''${json_string}''')    json
    set to dictionary    ${json["params"]}    MerchantId=${MerchantId}
    CreateSession        MerchantId       ${url_api}             verify=True
      
      
    ${header2}=          Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    MerchantId    /api/menu-yummy/    json=${json}    headers=${header2}

    # ${resp}=    Post Request    MerchantId    /api/menu-yummy    body=${json}    headers=${header2}
    ${status}=  Set Variable    ${resp.status_code}
    Should Be Equal As Strings	${resp.status_code}      ${status}
    log          ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}      200	
    ${jsondata}=  To Json  ${resp.content}
    ${jsonrpc}=     Set Variable    ${jsondata}[jsonrpc]
    ${id}=     Set Variable    ${jsondata}[id]  
    ${results}=     Set Variable    ${jsondata}[result] 
    ${result_Message}=     Set Variable    ${jsondata}[result][message]

        ${result}=         Evaluate        isinstance($jsonrpc, str)
        Log     result = ${result}, expected String
        Should be True      ${result}==True

        ${result}=         Evaluate        isinstance($id, {type{none})
        Log     result = ${result}, expected String
        Should be True      ${result}==True

        ${result}=         Evaluate        isinstance($results, dict)
        Log     result = ${result}, expected Dictionary
        Should be True      ${result}==True

        ${result}=         Evaluate        isinstance($message, str)
        Log     result = ${result}, expected String
        Should be True      ${result}==True
        Should Contain      ${message}       MerchantId not found

***Test Cases***
Yummy.Corp MerchantId
    MerchantId
    
