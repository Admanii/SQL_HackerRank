DECLARE @var int -- Declare
SELECT @var = 1 -- Initialization
    WHILE @var <= 20 -- condition
    BEGIN -- Begin
    PRINT replicate('* ', @var) -- Print
SET @var = @var + 1 -- increment
END