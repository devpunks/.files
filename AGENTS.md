# Code Conventions

## Whitespace

- Spaced slash in string output: ` / `
- Space before and after brackets: ` [ ... ] `
- Space before and after parentheses: ` ( ... ) `
- Spaced parentheses in string output: ` ( 39 % ) `
- Space before `()` on method calls: `.format ()`, `keySet ()`, `Limits.getHeapSize ()`
- Space before `(` on constructors / type casts: `Decimal.valueOf ( ... )`, `new Map <String, String> {`

## Formatting

- 75-char max line length
- 75-char max line length; break on `+` continuation, align continuation with `+`
- Leading commas for lists / maps: `, 'key' => value` (not trailing)
- Single-line per-document SOQL queries
- Annotations on their own line: `@isTest` then `static void test...`

## Method order (in base `Lender`)

`weigh` → `debug` → `info` → `warn` → `error` → `log`

## Patterns

- `weigh ( document );` at top of upload loop, not inline debug
- `document.VersionData = null;` after last use of VersionData, before next iteration
- `debug()` for diagnostic, `info()` for submission log
- `return this;` from `weigh()` (returns `Submission`)
- STAGING credentials active, PRODUCTION commented out
- Direct fields over relationship traversals: `Opportunity__c` not `Opportunity__r.Id`