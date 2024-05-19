*** Settings ***
Documentation  JSON RPC Verification
Resource  ../../../Resources/API/keywords.robot
Variables  ../../../Resources/API/TestData/Testdata.py

*** Test Cases ***
Valid Test ETH Get Latest Block By Number
     [Documentation]    Valid Test
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${latestBlock}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms result is present in response
     And user confirms difficulty is present in response
     And user confirms hash is present in response
     And user confirms number is present in response
     And user confirms x is present in response

Invalid Test ETH Get Block By Number - Missing method
     [Documentation]    Invalid Test with missing method
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${invalidBlockMethod}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Method is required is present in response

Invalid Test ETH Get Block By Number - Missing parameters
     [Documentation]    Invalid Test with missing parameters
     [tags]  Smoke
     Given user sets endpoint with base api ${API_BASE_ENDPOINT}
     And user sets headers ${headers}
     And user sets body ${invalidBlockParams}
     When user sends a POST request with query /
     Then user recieves valid HTTP response code 200
     Then user confirms error is present in response
     And user confirms Invalid params is present in response