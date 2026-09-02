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

- No trailing whitespace
- 75-char max line length
- 2 spaces per indentation level
- Single-line per-document SOQL queries
- Annotations on their own line: `@isTest` then `static void test...`
- Leading commas for lists / maps: `, 'key' => value` (not trailing)
- No lines with only whitespace (no blank lines containing spaces)
- 75-char max line length; break on `+` continuation, align continuation with `+`

## Method order (in base `Lender`)

`weigh` → `debug` → `info` → `warn` → `error` → `log`

## Closing comments

- Add `// ClassName` after class closing brace
- Add `// methodName` after method closing brace
- Add `// VARIABLE_NAME` after map/collection literal closing brace

## Patterns

- `debug()` for diagnostic, `info()` for submission log
- `document.VersionData = null;` after last use of VersionData, before next iteration
- Direct fields over relationship traversals: `Opportunity__c` not `Opportunity__r.Id`