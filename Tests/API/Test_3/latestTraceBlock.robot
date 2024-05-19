*** Settings ***
Documentation  TRACE NAMESPACE
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test Latest Trace Block
     [Documentation]    Test obtaining latest trace block details using trace_block method
     [tags]  Smoke
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body ${latestTraceBlock}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response

Invalid Test Latest Trace Block
     [Documentation]    Invalid Test obtaining latest trace block details using trace_block method
     [tags]  Smoke
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body ${invalidTraceBlock}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response