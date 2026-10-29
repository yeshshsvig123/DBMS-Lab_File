-- 1. Create Banking Database







CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
        HolderName VARCHAR(40) NOT NULL,
            Balance DECIMAL(12,2) NOT NULL CHECK (Balance >= 0)
            ) ENGINE=InnoDB;

            CREATE TABLE TransactionLog (
                TxnID INT AUTO_INCREMENT PRIMARY KEY,
                    FromAccount INT,
                        ToAccount INT,
                            Amount DECIMAL(12,2),
                                Status VARCHAR(20),
                                    TxnTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                                    ) ENGINE=InnoDB;

                                    INSERT INTO Accounts VALUES
                                    (101, 'Aarav Sharma', 10000.00),
                                    (102, 'Mira Patel', 5000.00),
                                    (103, 'Kabir Shah', 2500.00);

                                    SELECT * FROM Accounts
                                    ORDER BY AccountID;

                                    -- 2. COMMIT: Complete Transfer

                                    START TRANSACTION;

                                    UPDATE Accounts
                                    SET Balance = Balance - 1500.00
                                    WHERE AccountID = 101;

                                    UPDATE Accounts
                                    SET Balance = Balance + 1500.00
                                    WHERE AccountID = 102;

                                    INSERT INTO TransactionLog
                                        (FromAccount, ToAccount, Amount, Status)
                                        VALUES
                                            (101, 102, 1500.00, 'COMPLETED');

                                            COMMIT;

                                            SELECT AccountID, Balance
                                            FROM Accounts
                                            WHERE AccountID IN (101, 102);

                                            -- 3. ROLLBACK ON FAILURE

                                            START TRANSACTION;

                                            UPDATE Accounts
                                            SET Balance = Balance - 1000.00
                                            WHERE AccountID = 101;

                                            UPDATE Accounts
                                            SET Balance = Balance + 1000.00
                                            WHERE AccountID = 999;

                                            SELECT ROW_COUNT() AS RowsUpdated;

                                            ROLLBACK;

                                            SELECT AccountID, Balance
                                            FROM Accounts
                                            WHERE AccountID IN (101, 102);

                                            -- 4. SAVEPOINT AND PARTIAL FAILURE

                                            START TRANSACTION;

                                            UPDATE Accounts
                                            SET Balance = Balance - 500.00
                                            WHERE AccountID = 101;

                                            UPDATE Accounts
                                            SET Balance = Balance + 500.00
                                            WHERE AccountID = 103;

                                            SAVEPOINT after_first_transfer;

                                            UPDATE Accounts
                                            SET Balance = Balance - 9000.00
                                            WHERE AccountID = 102;

                                            -- Undo the second operation only.
                                            ROLLBACK TO SAVEPOINT after_first_transfer;

                                            INSERT INTO TransactionLog
                                                (FromAccount, ToAccount, Amount, Status)
                                                VALUES
                                                    (101, 103, 500.00, 'COMPLETED');

                                                    COMMIT;

                                                    SELECT AccountID, Balance
                                                    FROM Accounts
                                                    WHERE AccountID IN (101, 102, 103)
                                                    ORDER BY AccountID;

                                                    -- 5. DIRTY READ PREVENTION
                                                    -- Run SESSION 1 and SESSION 2 in separate MySQL windows.

                                                    -- SESSION 1

                                                    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

                                                    START TRANSACTION;

                                                    UPDATE Accounts
                                                    SET Balance = Balance - 200.00
                                                    WHERE AccountID = 102;

                                                    -- Keep the transaction open.

                                                    -- SESSION 2

                                                    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    -- SESSION 1

                                                    ROLLBACK;

                                                    -- 6. NON-REPEATABLE READ
                                                    -- Run the statements in the specified order across two sessions.

                                                    -- SESSION 1

                                                    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

                                                    START TRANSACTION;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    -- SESSION 2

                                                    START TRANSACTION;

                                                    UPDATE Accounts
                                                    SET Balance = Balance + 300.00
                                                    WHERE AccountID = 102;

                                                    COMMIT;

                                                    -- SESSION 1

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    COMMIT;

                                                    -- 7. REPEATABLE READ

                                                    -- SESSION 1

                                                    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

                                                    START TRANSACTION;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    -- SESSION 2

                                                    START TRANSACTION;

                                                    UPDATE Accounts
                                                    SET Balance = Balance + 200.00
                                                    WHERE AccountID = 102;

                                                    COMMIT;

                                                    -- SESSION 1

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    COMMIT;

                                                    -- New transaction sees the latest committed value.
                                                    START TRANSACTION;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 102;

                                                    COMMIT;

                                                    -- 8. LOST UPDATE PREVENTION USING ROW LOCKS
                                                    -- Run SESSION 1 first, then SESSION 2 while Session 1 is open.

                                                    -- SESSION 1

                                                    START TRANSACTION;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 103
                                                    FOR UPDATE;

                                                    UPDATE Accounts
                                                    SET Balance = Balance + 100.00
                                                    WHERE AccountID = 103;

                                                    COMMIT;

                                                    -- SESSION 2

                                                    START TRANSACTION;

                                                    SELECT Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 103
                                                    FOR UPDATE;

                                                    UPDATE Accounts
                                                    SET Balance = Balance + 200.00
                                                    WHERE AccountID = 103;

                                                    COMMIT;

                                                    -- Verify final balance.

                                                    SELECT AccountID, HolderName, Balance
                                                    FROM Accounts
                                                    WHERE AccountID = 103;