create database task14

---1----
--table hobbies
create table hobbies
(hobby_id int primary key,
hobby_name varchar(20) unique)

--table errorbackup
CREATE TABLE ErrorBackup (
    ErrorBackupID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorMessage VARCHAR(MAX),
    ErrorNumber INT,
    ErrorSeverity INT,
    ErrorState INT,
    ErrorLine INT,
    ErrorProcedure VARCHAR(100),
    ErrorDateTime DATETIME DEFAULT GETDATE()
);

--procedure inserthobby
alter PROCEDURE InsertHobbie
@hobby_id varchar(20),
    @Hobby_Name VARCHAR(50)
AS
BEGIN
    INSERT INTO Hobbies (hobby_id , hobby_name) VALUES (@hobby_id , @Hobby_Name);
END

BEGIN TRY
    EXEC InsertHobbie 1,'baking';
    EXEC InsertHobbie 2,'Gardening';
    EXEC InsertHobbie 3,'sleeping';
    EXEC InsertHobbie 1,'coding';

   
END TRY
BEGIN CATCH
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
    PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR);
    PRINT 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR);
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR);
    PRINT 'Error Procedure: ' + CAST(ERROR_PROCEDURE() AS VARCHAR);
   
    -- Storing the error details in the ErrorBackup table
    INSERT INTO  errorbackup (ErrorMessage, ErrorNumber, ErrorSeverity, ErrorState, ErrorLine, ErrorProcedure)
    VALUES (ERROR_MESSAGE(), ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_LINE(), ERROR_PROCEDURE());
END CATCH

select * from hobbies
select * from errorbackup

--2---
alter procedure calculate(@num1 int,@num2 int)
as
begin
  if @num1=@num2
  begin
  declare
  @product int
  set @product =@num1 * @num2;
   print 'the product is'+(cast(@product as varchar));
    end
  else
  begin
  declare @errormessage varchar(500)
 Raiserror(@errormessage,16,1);
  print'The numbers are not not equal';
  end
  end

  exec calculate 2,2

  --3--

create table friends(name varchar(50))

alter procedure p_friends
@name varchar(25)
as
begin
if LEFT(@name ,1) in (' A','D','H','K','P','R','S','T','V','Y')
begin
insert into friends values(@name)
end
else
begin
throw 50002,'name must begin only  with A,D,H,K,P,R,S,T,V,Y ',1;
end
end

exec p_friends 'xanita'
select * from friends