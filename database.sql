--QUESTION 1 - GET ALL USERS FROM CHICAGO
SELECT "username", "city"
FROM "accounts"
WHERE "city" = 'chicago';

--QUESTION 2 - GET ALL USERS WITH USERNAMES CONTAINING LETTER A
SELECT "username"
FROM "accounts"
WHERE "username" ILIKE '%a%';

--QUESTION 3 - UPDATE ALL RECORDS WITH ACCOUNT BALANCE OF 0.00 AND TRANSACTIONS_ATTEMPTED OF 0 AND GIVE NEW ACCOUNT BALANCE OF 10.00
UPDATE "accounts"
SET "account_balance" = 10.00
WHERE  ("account_balance" = 0 AND "transactions_attempted" = 0);

--QUESTION 4 - SELECT ALL USERS THAT HAVE ATTEMPTED 9 OR MORE TRANSACTIONS
SELECT "username", "transactions_attempted" FROM "accounts"
WHERE "transactions_attempted" >= 9;

--QUESTION 5 - GET USERNAME AND ACCOUNT BALANCE OF THE 3 USERS WITH THE HIGHEST BALANCES, SORTED HIGHEST TO LOWEST (RESEARCH: LIMIT)
SELECT * FROM "accounts"
ORDER BY "account_balance" DESC
LIMIT 3;

--QUESTION 6 - GET USERNAME AND ACCOUNT BALANCE OF THE 3 USERS WITH THE HIGHEST BALANCES, SORTED LOWEST TO HIGHEST (RESEARCH: LIMIT)
SELECT * FROM "accounts"
ORDER BY "account_balance" ASC
LIMIT 3;

--QUESTION 7 -- GET ALL USERS WITH ACCOUNTS BALANCES THAT ARE MORE THAN $100
SELECT * FROM "accounts"
WHERE "account_balance" > 100;

--QUESTION 8 -- HOW DO YOU ADD A NEW ACCOUNT?
INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance")
VALUES ('maxmaher', 'st. paul', 0, 0, 2.65);

--QUESTION 9 -- LOSING MONEY IN MIAMI AND PHOENIX.  UNLOAD LOW TRANSACTION CUSTOMERS.  DELETE USERS IN MIAMI OR PHOENIX WITH FEWER THAN FIVE TRANSACTIONS?
DELETE FROM "accounts"
WHERE ("city" = 'miami' OR "city" = 'phoenix')
AND "transactions_completed" < 5;

--STRETCH 1 -- ANTHONY MOVED TO SANTA FE
UPDATE "accounts"
SET "city" = 'santa fe'
WHERE ("username" = 'anthony');

--STRETCH 2 -- GRACE CLOSED HER ACCOUNT
DELETE FROM "accounts"
WHERE ("username" = 'grace');

--STRETCH 3 -- TRAVIS WITHDREW $20,000.  NEW BALANCE?  (RESEARCH RETURNING). --RETURNING id, created;
UPDATE "accounts"
SET "account_balance" = "account_balance" - 20000
WHERE ("username" = 'travis')
RETURNING *;

--STRETCH 4 -- NEED TO TRACK LAST NAMES.  (RESEARCH ALTER TABLE)
ALTER TABLE "accounts"
ADD COLUMN "last_name" varchar(30);