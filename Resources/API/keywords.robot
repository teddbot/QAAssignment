*** Settings ***

Resource  Common.robot
Variables  ./TestData/Testdata.py

*** Variables ***
${NODE_URL}     /

*** Keywords ***

user recieves valid HTTP response code ${res_code}
    Common.confirm response code ${res_code}

user confirms if object present in body ${verify_object}
    Common.object present in body ${verify_object}

user confirms ${isInResponse} is present in response
    Common.confirm is present in response ${isInResponse}

user sets endpoint with base api ${BASE_API}
    Common.session creation ${BASE_API}

user sends a POST Request with query ${QUERY}
    Common.POST a Request with query ${QUERY}

#user sends a POST Request ${NODE_URL}
#    Common.POST a Request ${NODE_URL}

user enters body ${arg}
    log to console  ${arg}

user sets headers ${headers}
    Common.add headers ${headers}

user sets body ${body}
    Common.add json body ${body}

user sets testdata file ${json_file}
    Common.set data file ${json_file}