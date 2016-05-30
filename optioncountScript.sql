-- Student Name: Hamzah Shafeeq
-- Function assignment

Accept p_serial prompt 'Enter serial : '
VARIABLE g_output VARCHAR2(100)
DECLARE
	e_ex EXCEPTION;
	v_serial car.serial%TYPE;
	v_make   car.make%TYPE;
	v_model	 car.model%TYPE;
	v_number NUMBER;
BEGIN
	IF '&p_serial' IS NULL THEN
		RAISE e_ex;
	END IF;	
	SELECT serial, make, model, OPTIONCOUNT('&p_serial') as "# options"
	INTO v_serial, v_make, v_model, v_number
    FROM car
	WHERE serial = '&p_serial';
	:g_output:= v_serial || ' ' || v_make || ' ' || v_model || ' ' || v_number;
EXCEPTION
	WHEN e_ex THEN :g_output := 'Oops the serial field can not be empty!';
END;
/
PRINT g_output;	