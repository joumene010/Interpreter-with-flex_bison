# 📜 SQL Query Interpreter using Flex/Bison

## 📌 Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Tools Used](#tools-used)
- [Lexical Analysis](#lexical-analysis)
- [Grammars](#grammars)
- [Build & Execution](#build--execution)
- [Example Queries](#example-queries)
- [Author](#author)

## 🔍 Project Overview
This project implements a **SQL query interpreter** using:
- 📝 **Flex** for lexical analysis
- 📚 **Bison** for parsing
- 🏗 **Make** for build automation

It supports basic SQL operations including **CREATE, DELETE, UPDATE, and SELECT** queries with various clauses.

## ✨ Features
### ✅ Supported SQL Operations
| Operation | Description |
|-----------|-------------|
| `CREATE TABLE` | Create tables with constraints |
| `DELETE` | Delete records with conditions |
| `UPDATE` | Modify existing records |
| `SELECT` | Query data with filters |

### 🏷️ Supported Clauses
- `WHERE` with conditions
- `GROUP BY` for aggregation
- `ORDER BY` for sorting
- `LIMIT` for result restriction

### 🔢 Data Types
- `INT`
- `VARCHAR`
- `DATE`
- `DECIMAL`

## 🛠️ Tools Used
### 📌 Flex (Lexical Analyzer)
- Tokenizes input SQL queries
- Recognizes:
  - Keywords (`SELECT`, `FROM`, etc.)
  - Identifiers (table/column names)
  - Literals (numbers, strings)
  - Operators (`=`, `!=`, etc.)

### 📌 Bison (Parser Generator)
- Validates query structure
- Implements grammar rules
- Builds abstract syntax tree

### 📌 Make
Build automation tool with the following configuration:

```makefile
all:
    flex -o sql_lexer.c --header=sql_lexer.h sql_lexer.l
    bison -d sql_parser.y
    gcc sql_parser.tab.c sql_lexer.c -o sql_interpreter.exe
    ./sql_interpreter.exe input.txt

clean:
    rm *.o *.c *.h *.exe
```

## 🔎 Lexical Analysis
### 🔠 Token Definitions
| Lexeme Pattern | Token Type |
|----------------|------------|
| `CREATE` | `CREATE` |
| `DELETE` | `DELETE` |
| `[a-zA-Z_][a-zA-Z0-9_]*` | `IDENTIFIER` |
| `[0-9]+` | `NUMBER` |
| `'[^']*'` | `STRING` |
| `=` | `EQ` |
| `!=` | `NE` |
| `<` | `LT` |
| `<=` | `LE` |
| `>` | `GT` |
| `>=` | `GE` |

## 📖 Grammars
### 🔹 SELECT Statement
```bison
select_statement:
    SELECT select_list
    FROM table_list
    [WHERE condition_list]
    [GROUP BY identifier_list]
    [ORDER BY identifier_list [ASC|DESC]]
    [LIMIT NUMBER]
    ;
```

### 🔹 CREATE Statement
```bison
create_statement:
    CREATE TABLE IDENTIFIER
    LPAREN column_def_list RPAREN
    ;

column_def_list:
    column_def
    | column_def_list COMMA column_def
    ;
```

## ⚙️ Build & Execution
### 📌 Requirements
- Flex
- Bison
- GCC
- Make

### 🚀 Build Steps
1. Install dependencies:
   ```bash
   sudo apt-get install flex bison gcc make
   ```

2. Build the project:
   ```bash
   make
   ```

3. Run the interpreter:
   ```bash
   ./sql_interpreter.exe queries.txt
   ```

## 📝 Example Queries
### 📌 CREATE TABLE
```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    hire_date DATE
);
```

### 📌 SELECT Query
```sql
SELECT * FROM employees
WHERE hire_date > '2020-01-01'
ORDER BY name ASC
LIMIT 10;
```

### 📌 DELETE Query
```sql
DELETE FROM employees
WHERE emp_id = 1234;
```

### 📌 UPDATE Query
```sql
UPDATE employees
SET salary = 75000
WHERE department = 'Engineering';
```

## 👨‍💻 Author
**Joumene Ben Said**  
*Compilation Techniques Project*

