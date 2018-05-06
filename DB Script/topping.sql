
# INSERT ############################################

CREATE PROCEDURE insert_topping
	@name varchar(100),
	@price float
as
	if(@name=null OR @name='')
	begin
		SELECT
			'CREATE FAILED, name field is required.' as state
	end
	else if(@price=null OR @price<=0)
	begin
		SELECT
			'CREATE FAILED, price field is required and must be greater than 0.' as state
	end
	else 
	begin
		INSERT INTO Topping (name, status, price) values (@name, 1, @price)
		SELECT
			CONCAT('SUCCESS!, created new ',@name,' topping.') as state
	end


# SELECT ############################################
	
CREATE PROCEDURE select_topping
	@option varchar(100)
as
	if(@option='active')
	begin
		SELECT
			*
		FROM
			Topping
		WHERE 
			status=1
	end
	elseif(@option='inactive')
	begin
		SELECT
			*
		FROM
			Topping
		WHERE
			status=0
	end
	else
	begin
		SELECT
			*
		FROM
			Topping
	end

# INACTIVE or ACTIVE ############################################

CREATE PROCEDURE availability_topping
	@id int,
	@option varchar(100)
as
	if(@option=1)
	begin
		UPDATE 
			TOPPING
		SET
			status = 0
		WHERE
			ID = @id
	end
	else 
	begin
		UPDATE 
			TOPPING
		SET
			status = 1
		WHERE
			ID = @id
	end
