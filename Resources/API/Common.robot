*** Settings ***
Library  JSONLibrary
Library  RequestsLibrary
Library  SeleniumLibrary
Library  OperatingSystem
Library   ../../Library/jsonExtender.py
Library   ../../Library/stringToDict.py
Library  urllib3
Library  String
Library  DateTime


Variables  ./TestData/Testdata.py


***Variables***
# Global Variables default empty if value not set
${NODE_URL}    http://139.144.26.89:4000    # Update with your Ethereum node URL
${headers}      {"Content-Type": "application/json"}
${body}
# default test data file Path
${PATH}=    ${CURDIR}\\TestData

*** Keywords ***
session creation ${API_BASE_ENDPOINT}
    Create Session  mysession  ${API_BASE_ENDPOINT}   verify=False  debug=0

# verification to confirm the response code
confirm response code ${res_code}
    Should Be Equal As Strings   ${res_code}  ${response.status_code}

# verification confirm key present in response
confirm is present in response ${KeyInResponse}
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  ${KeyInResponse}
    Set test Variable   ${key}   ${KeyInResponse}

add headers ${headersArgs}
    ${header_string}  evaluate  json.loads('''${headersArgs}''')   json
    # Makes a variable available everywhere within the scope of the current test.
    Set test Variable   ${headers}   ${header_string}

add json body ${body}
    ${json_string}  evaluate  json.dumps(${body})   json
    # Makes a variable available everywhere within the scope of the current test.
    Set test Variable   ${body}   ${json_string}

POST a Request with query ${QUERY}
    # set proxy
    ${response}=  Post On Session    mysession  ${QUERY}  data=${body}  headers=${headers}
    # Makes a variable available everywhere within the scope of the current test.
    Set Test Variable    ${response}

