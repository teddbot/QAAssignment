*** Settings ***
Documentation  TRACE NAMESPACE
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test Pending Trace Block
     [Documentation]    Test obtaining pending trace block details using trace_block method
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${pendingTraceBlock}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response
     And user confirms author is present in response
     And user confirms blockHash is present in response
     And user confirms blockNumber is present in response

Invalid Test Pending Trace Block - missing params
     [Documentation]    Invalid Test with missing params
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${invalidTraceBlock}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response