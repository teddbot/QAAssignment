*** Settings ***
Documentation  TRACE NAMESPACE
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test Safe Trace Block
     [Documentation]    Test obtaining safe trace block details using trace_block method
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body ${safeTraceBlock}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response

Invalid Test Safe Trace Block
     [Documentation]    Invalid Test obtaining safe trace block details using trace_block method
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body {"jsonrpc": "2.0", "id": 0, "method": "trace_block", "params": "invalid_params"}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response