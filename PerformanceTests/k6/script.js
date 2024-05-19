import http from 'k6/http';
import { check, sleep, group } from 'k6';
import { htmlReport } from 'https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js';

export let options = {
    scenarios: {
        load_test_getBlock: {
            executor: 'ramping-vus',
            exec: 'loadTestGetBlock',
            startTime: '0s',
            stages: [
                { duration: '30s', target: 100 },  // 100 users for 30 seconds
//                { duration: '1m', target: 500 },   // 500 users for 1 minute
//                { duration: '2m', target: 1000 },  // 1000 users for 2 minutes
//                { duration: '4m', target: 1000 },  // 1000 users for 4 minutes (steady state)
//                { duration: '2m', target: 500 },  // decrease to 500 users over 2 minutes
//                { duration: '1m', target: 500 },   // decrease to 500 users over 1 minute
//                { duration: '30s', target: 0 },    // decrease to 0 users over 30 seconds
            ],
            gracefulStop: '30s',
        },
        load_test_getBlockByNumber: {
            executor: 'ramping-vus',
            exec: 'loadTestGetBlockByNumber',
            startTime: '0s',
            stages: [
                { duration: '30s', target: 50 },   // 50 users for 30 seconds
//                { duration: '1m', target: 200 },   // 200 users for 1 minute
//                { duration: '2m', target: 500 },   // 500 users for 2 minutes
//                { duration: '4m', target: 500 },   // 500 users for 4 minutes (steady state)
//                { duration: '2m', target: 200 },   // decrease to 200 users over 2 minutes
//                { duration: '1m', target: 200 },   // decrease to 200 users over 1 minute
//                { duration: '30s', target: 0 },    // decrease to 0 users over 30 seconds
            ],
            gracefulStop: '30s',
        },
        load_test_traceBlock: {
            executor: 'ramping-vus',
            exec: 'loadTestTraceBlock',
            startTime: '0s',
            stages: [
                { duration: '30s', target: 20 },   // 20 users for 30 seconds
//                { duration: '1m', target: 50 },    // 50 users for 1 minute
//                { duration: '2m', target: 100 },   // 100 users for 2 minutes
//                { duration: '4m', target: 100 },   // 100 users for 4 minutes (steady state)
//                { duration: '2m', target: 50 },    // decrease to 50 users over 2 minutes
//                { duration: '1m', target: 50 },    // decrease to 50 users over 1 minute
//                { duration: '30s', target: 0 },    // decrease to 0 users over 30 seconds
            ],
            gracefulStop: '30s',
        },
    },
};

function getBlockTest() {
    let requestBody = `{"jsonrpc":"2.0","id":0,"method":"eth_blockNumber","params":[]}`;
    let response = http.post(
        'http://139.144.26.89:8545',
        requestBody,
        {
            headers: {
                'Content-Type': 'application/json',
            },
        }
    );
    check(response, {
        'is status 200': (r) => r.status === 200,
    });
    return response;
}

function getBlockByNumberTest() {
    let requestBody = `{"jsonrpc":"2.0","id":0,"method":"eth_getBlockByNumber","params":["earliest", true]}`;
    let response = http.post(
        'http://139.144.26.89:8545',
        requestBody,
        {
            headers: {
                'Content-Type': 'application/json',
            },
        }
    );
    check(response, {
        'is status 200': (r) => r.status === 200,
    });
    return response;
}

function traceBlockTest() {
    let requestBody = `{"jsonrpc":"2.0","id":0,"method":"trace_block","params":[0]}`;
    let response = http.post(
        'http://139.144.26.89:8545',
        requestBody,
        {
            headers: {
                'Content-Type': 'application/json',
            },
        }
    );
    check(response, {
        'is status 200': (r) => r.status === 200,
    });
    return response;
}

export function loadTestGetBlock() {
    group('Load Test - Get Block', function () {
        getBlockTest();
        sleep(1);
    });
}

export function loadTestGetBlockByNumber() {
    group('Load Test - Get Block By Number', function () {
        getBlockByNumberTest();
        sleep(1);
    });
}

export function loadTestTraceBlock() {
    group('Load Test - Trace Block', function () {
        traceBlockTest();
        sleep(1);
    });
}

