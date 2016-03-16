USE[Masha]
GO
CREATE TRIGGER MyTriggerForDelete1
   ON bukety
   AFTER DELETE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select id from deleted) = '1'
		BEGIN
		rollback
		print 'Нельзя удалять запись!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForDelete2
   ON action
   AFTER DELETE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select end_date from deleted) < GETDATE()
		BEGIN
		rollback
		print 'Заказ еще не выполнен!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForDelete3
   ON soder_of_buket
   AFTER DELETE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select id_cveta from deleted) = '0'
		BEGIN
		rollback
		print 'Нельзя удалять!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END


GO
CREATE TRIGGER MyTriggerForInsert1
   ON zakazy
   AFTER INSERT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;	
		if (select all_price from inserted) > '100000'
		BEGIN
		rollback
		print 'Цена слишком велика!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForInsert2
   ON zakazy
   AFTER INSERT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select all_price from inserted) < '1'
		BEGIN
		rollback
		print 'Цена слишком мала!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForInsert3
   ON bukety
   AFTER INSERT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select amount from inserted) < '0'
		BEGIN
		rollback
		print 'Кол-во не должно быть меньше 0!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForUpdate1
   ON zakazy
   AFTER UPDATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		IF (SELECT all_price FROM updated) > '100000'
		BEGIN
		rollback
		print 'Цена слишком велика!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForUpdate2
   ON zakazy
   AFTER UPDATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		IF (SELECT all_price FROM updated) < '1'
		BEGIN
		rollback
		print 'Цена не должно быть меньше 1!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END

GO
CREATE TRIGGER MyTriggerForUpdate3
   ON bukety
   AFTER UPDATE
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		if (select amount from updated) < '0'
		BEGIN
		rollback
		print 'Кол-во не должно быть меньше 0!'
		END
	END TRY
	BEGIN CATCH
		print 'Ошибка!';
		THROW
	END CATCH
END
