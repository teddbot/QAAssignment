*** Settings ***
Documentation  JSON RPC Verification
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test ETH Get Pending Block By Number
     [Documentation]    Test obtaining pending block details using eth_getBlockByNumber endpoint
     [tags]  Smoke
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body ${pendingBlock}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response

Invalid Test ETH Get Block By Number
     [Documentation]    Invalid Test obtaining block details using eth_getBlockByNumber endpoint
     [tags]  Smoke
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body {"jsonrpc": "2.0", "id": 0, "method": "eth_getBlockByNumber", "params": "invalid_params"}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response