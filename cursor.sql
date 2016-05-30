-- Student Name: Hamzah Shafeeq
-- CURSOR assignment
Accept p_make prompt 'Enter make : '
Accept p_model prompt 'Enter model : '
Accept p_year prompt 'Enter year : '
Accept p_color prompt 'Enter color : '
VARIABLE g_output VARCHAR2(4000)
DECLARE
	e_ex EXCEPTION;
    CURSOR desire IS
    SELECT DISTINCT s.cname AS name, caddress, ccity, cstate, czip
    FROM prospect p, customer s
    WHERE s.cname = p.cname
    AND p.make = '&p_make'
    AND p.model = '&p_model'
    AND p.cyear = '&p_year'
    AND p.color = '&p_color';
BEGIN
	IF '&p_make' IS NULL THEN
		RAISE e_ex;
	END IF;	
	:g_output := '&p_make' || ' ' || '&p_model' || CHR(10) || '&p_year' || ' ' || '&p_color';
	FOR v_desire IN desire LOOP
	:g_output := :g_output || CHR(10) || CHR(10) || v_desire.name || CHR(10) || v_desire.caddress || CHR(10) || TRIM(v_desire.ccity) || ', ' || TRIM(v_desire.cstate) || ' ' || v_desire.czip;
	END LOOP;
EXCEPTION
	WHEN e_ex THEN :g_output := 'Oops the make field can not be empty!';
END;
/
PRINT g_output;
	
	
	
	
	
	
	
	
	
	
	
	