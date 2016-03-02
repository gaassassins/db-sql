USE [masha]
GO

INSERT INTO [dbo].[dostavka]
           ([name]
           ,[description])
     VALUES
           ('lilii', 'prekrasny') 
GO

INSERT INTO [dbo].[upakovka]
           ([name]
           ,[description])
     VALUES
           ('krasivaya', 'krasivaya') 
GO


INSERT INTO [dbo].[cvet]
           ([name]
           ,[description])
     VALUES
           ('color', 'black') 
GO

INSERT INTO [dbo].[client]
           ([name]
           ,[email]
		   ,[phone]
		   ,[city])
     VALUES
           ('anton', 'antonneoch@mail', '666', 'engels') 
GO

INSERT INTO [dbo].[lentochky]
           ([id_color]
           ,[name]
           ,[image])
     VALUES
           ('1', 'lentochka', 'afsdfds.jpg')

GO


INSERT INTO [dbo].[type of cvetok]
           ([name]
           ,[description]
           ,[image])
     VALUES
           ('type1', 'описание', '42424.jpg')

GO

INSERT INTO [dbo].[cvety]
           ([id_type_cvetok]
           ,[id_cvet]
           ,[price]
		   ,[image]
		   ,[langht])
     VALUES
           ('1', '1', '2000', '34224.jpg', '2999')





