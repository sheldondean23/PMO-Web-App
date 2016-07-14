CREATE TRIGGER tr_Audit_Information ON tblProjectInformation FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectInformation'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Resources ON tblProjectResources FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectResources'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Facilities ON tblProjectFacilities FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectFacilities'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Dates ON tblProjectDates FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectDates'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_StatusUpdates ON tblProjectStatusUpdates FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectStatusUpdates'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Purpose ON tblProjectPurpose FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectPurpose'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Budget ON tblProjectBudget FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectBudget'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Categories ON tblProjectCategories FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectCategories'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Requester ON tblProjectRequester FOR INSERT, UPDATE, DELETE
AS
DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname VARCHAR(128) ,
       @TableName VARCHAR(128) ,
       @PKCols VARCHAR(1000) ,
       @sql VARCHAR(2000), 
       @UpdateDate VARCHAR(21) ,
       @UserName VARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect VARCHAR(1000)
       

--You will need to change @TableName to match the table to be audited
SELECT @TableName = 'tblProjectRequester'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT(VARCHAR(8), GETDATE(), 112) 
               + ' ' + CONVERT(VARCHAR(12), GETDATE(), 114)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       +'+convert(varchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert tblAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(varchar(1000),d.' + @fieldname + ')'
       + ',convert(varchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO

CREATE TRIGGER tr_Audit_Delete ON tblAudit FOR INSERT
AS
	
IF 10000 < (SELECT SUM (row_count) FROM sys.dm_db_partition_stats WHERE object_id=OBJECT_ID('tblAudit') AND (index_id=0 or index_id=1))
	DELETE FROM tblAudit
	WHERE A IN
	(SELECT TOP 4000

GO
