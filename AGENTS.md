# Code Conventions

## Whitespace

- Always use spaces, never tabs
- Spaced slash in string output: ` / `
- Space before and after brackets: ` [ ... ] `
- Space before and after curly braces: ` { ... } ` (space between braces and content;
  skip interior space for empty `{}` but keep space before)
-         Space before and after parentheses: ` ( ... ) ` (space between parens and content;
  skip interior space for empty `()` but keep space before)
- Spaced parentheses in string output: ` ( 39 % ) `
- Space before `()` on method calls: `.format ()`, `keySet ()`, `Limits.getHeapSize ()`
- Space before `(` on constructors / type casts: `Decimal.valueOf ( ... )`, `new Map <String, String> {`

## Formatting

- 75-char max line length
- Single-line per-document SOQL queries
- Leading commas for lists / maps: `, 'key' => value` (not trailing)
- Annotations on their own line: `@isTest` then `static void test...`
- 75-char max line length; break on `+` continuation, align continuation with `+`

## Method order (in base `Lender`)

`weigh` → `debug` → `info` → `warn` → `error` → `log`

## Patterns

- `debug()` for diagnostic, `info()` for submission log
- `document.VersionData = null;` after last use of VersionData, before next iteration
- Direct fields over relationship traversals: `Opportunity__c` not `Opportunity__r.Id`