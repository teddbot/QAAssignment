*** Settings ***
Documentation  JSON RPC Verification
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test ETH Block Number
     [Documentation]    Test retrieving the chain head using eth_blockNumber API call
     [tags]  Smoke
     Given user sets endpoint with base api ${NODE_URL}
     And user sets headers ${headers}
     And user sets body ${blockNumber}
     And user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response
     And user confirms id is present in response
     And user confirms jsonrpc is present in response
     And user confirms x is present in response

Invalid Test ETH Block Number - Missing Method
    [Documentation]    Invalid Test case with missing 'method' key in request body
    [tags]  Smoke
    Given user sets endpoint with base api ${NODE_URL}
    And user sets headers ${headers}
    And user sets body {"jsonrpc": "2.0", "id": 0, "params": []}  # 'method' key is missing
    And user sends a POST request with query /
    Then user recieves valid HTTP response code 200
    Then user confirms error is present in response
    And user confirms Method is required is present in response