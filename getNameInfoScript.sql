-- Student Name: Hamzah Shafeeq
-- ProcedureScript assignment
Accept p_beginningLetter prompt 'Enter beginning letter : '
Accept p_endingLetter prompt 'Enter ending letter: '
variable g_output varchar2(4000)
DECLARE
	e_ex EXCEPTION;
	CURSOR cnames IS
	SELECT *
	FROM saleinv
	where cname between '&p_beginningLetter' and '&p_endingLetter';
	v_sum NUMBER;
    v_count NUMBER;
	v_tab CHAR(1):=CHR(9);
BEGIN
	IF '&p_beginningLetter' IS NULL THEN
		RAISE e_ex;
	END IF;	
	FOR v_cname IN cnames LOOP
		getInfo(v_cname.cname, v_sum, v_count);
		:g_output:= :g_output || CHR(10) || v_cname.cname || ' ' || v_sum || '       ' || v_count;
	END LOOP;
	EXCEPTION
	WHEN e_ex THEN :g_output := 'Oops the beginning letter field can not be empty!';
END;
/
PRINT g_output;
