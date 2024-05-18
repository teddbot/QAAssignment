# JSON_RPC_VERIFICATION
class environment:
    # creating an enum for the environment
    UAT = "UAT"
    SIT = "SIT"
    PROD = "PROD"


# Mapping the environment to the class
def get_environment(self, environment):
    if environment == self.UAT:
        return UAT
    elif environment == self.SIT:
        return SIT
    elif environment == self.PROD:
        return PROD
    else:
        raise Exception("environment not found")

class UAT:
    Url = ""
    USERNAME = ""
    PASSWORD = ""

class SIT:
    Url = ""
    USERNAME = ""
    PASSWORD = ""

class PROD:
    Url = ""
    USERNAME = ""
    PASSWORD = ""


NODE_URL= "http://localhost:8545"
# JSON_RPC_headers = {"Content-Type": "application/json"}

blockNumber = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_blockNumber",
      "params": []
    }
earliestBlock = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_getBlockByNumber",
      "params": ["earliest", True]
    }
finalizedBlock = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_getBlockByNumber",
      "params": ["finalized", True]
    }
latestBlock = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_getBlockByNumber",
      "params": ["latest", True]
    }
pendingBlock = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_getBlockByNumber",
      "params": ["pending", True]
    }
safeBlock = {
      "jsonrpc": "2.0",
      "id": 0,
      "method": "eth_getBlockByNumber",
      "params": ["safe", True]
    }