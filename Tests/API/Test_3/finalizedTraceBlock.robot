*** Settings ***
Documentation  TRACE NAMESPACE
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test Finalized Trace Block
     [Documentation]    Test obtaining finalized trace block details using trace_block method
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${finalizedTraceBlock}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms message is present in response

Invalid Test Finalized Trace Block - missing params
     [Documentation]    Invalid Test with missing params
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${invalidTraceBlock}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response