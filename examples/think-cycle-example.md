# Example: /think Output

## Scenario
After building the API, the developer audits the authentication module output.

## Command
```
/think @src/auth/middleware.ts --input-files src/auth/jwt.ts,src/auth/routes.ts --expected-count 4
```

## Cycle Audit Report

### Verdict: CYCLE_FAILED

### Evidence Protocol
| Check | Count | Violations |
|-------|-------|------------|
| Cited claims | 8/10 | 2 uncited |
| Verified numbers | 3/3 | 0 |
| Broken citations | 0 | - |

### Accountability Checks
| Check | Result |
|-------|--------|
| Output valid | PASS |
| Count matches (expected: 4 endpoints) | PASS |
| No empty fields | FAIL — refreshToken handler has empty error response |

### Framework Results
| Framework | Verdict | Key Finding |
|-----------|---------|-------------|
| Deep Dive | PASS | JWT implementation correctly uses RS256 |
| Tri-Strike | PASS | Expectations match capabilities match test results |
| Gap Finder | FAIL | No account lockout after failed attempts, no rate limiting on /login |
| Devil's Advocate | FAIL | Refresh token stored in localStorage — XSS vulnerable |
| Drift Detector | PASS | Implementation matches original auth spec |

### Issues to Fix
1. **Gap Finder:** Add account lockout (5 failed attempts → 15min lock) and rate limiting on /login endpoint
2. **Devil's Advocate:** Move refresh token from localStorage to httpOnly cookie
3. **Evidence Protocol:** 2 uncited claims in middleware.ts need source citations
