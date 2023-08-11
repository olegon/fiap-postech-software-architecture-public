import http from 'k6/http'
import { check } from 'k6'
import { Rate } from 'k6/metrics';

const failureRate = new Rate('check_failure_rate');

export const options = {
    vus: 1000,
    duration: '90s'
};

export default function () {
    const res = http.get('http://localhost:3000/v1/count');
    // const res = http.get('http://localhost:8080');

    check(res, {
        'status is 200': r => r.status === 200
    }) || failureRate.add(1);
};
