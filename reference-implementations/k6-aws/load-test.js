import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 }, // Ramp up
    { duration: '1m', target: 50 },  // Stay at peak
    { duration: '30s', target: 0 },  // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% of requests must be below 500ms
    http_req_failed: ['rate<0.01'],   // Less than 1% failure rate
  },
};

export default function () {
  // Targeting an AWS Lambda URL or API Gateway
  const res = http.get('https://api.example-aws-app.com/v1/health');
  
  check(res, {
    'status is 200': (r) => r.status === 200,
    'body contains OK': (r) => r.body.includes('OK'),
  });
  
  sleep(1);
}
