import http from 'k6/http';
import { check, sleep, group } from 'k6';
import { htmlReport } from 'https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js';

export let options = {
    scenarios: {
        load_test: {
            executor: 'ramping-vus',
            exec: 'loadTest',
            startTime: '0s',
            stages: [
                { duration: '30s', target: 100 },  // 100 users for 30 seconds
                { duration: '1m', target: 500 },   // 500 users for 1 minute
                { duration: '2m', target: 1000 },  // 1000 users for 2 minutes
                { duration: '4m', target: 1000 },  // 1000 users for 4 minutes (steady state)
                { duration: '2m', target: 500 },  // decrease to 500 users over 2 minutes
                { duration: '1m', target: 500 },   // decrease to 500 users over 1 minute
                { duration: '30s', target: 0 },    // decrease to 0 users over 30 seconds
            ],
            gracefulStop: '30s',
        },
    },
};


function getBlockTest() {

    let requestBody = `{"jsonrpc":"2.0","id":0,"method":"eth_chainId","params":[]}`;

    let response = http.post(
        'http://localhost:8545',
        requestBody,
        {
            headers: {
                'Content-Type': 'application/json',
            },
        }
    );

    // Example check: Validate response status is 200 OK
    check(response, {
        'is status 200': (r) => r.status === 200,
        // You can add more checks as per your requirements
    });

    // Optionally, you can log the response body for debugging
    // console.log(response.body);

    // Returning the response can be useful if you want to further process it outside this function
    return response;
}

export function loadTest() {
    group('Load Test', function () {
        getBlockTest();
        sleep(1);
    });
}

export function handleSummary(data) {
  return {
    'summary.html': htmlReport(data),
  };
}