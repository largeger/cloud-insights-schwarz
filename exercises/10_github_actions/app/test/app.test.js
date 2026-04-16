const request = require('supertest');
const app = require('../index');

describe('GET /', () => {
  it('should respond with the correct message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.text).toContain('Hello Cloud Basics 2026!');
  });
});
