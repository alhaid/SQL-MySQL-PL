CREATE OR REPLACE TRIGGER carTrigger
BEFORE INSERT OR UPDATE OR DELETE OF serial, make, model, color ON car
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      :new.serial:=UPPER(:new.serial);
      :new.make:=UPPER(:new.make);
	  :new.model:=UPPER(:new.model);
      :new.color:=UPPER(:new.color);
      INSERT INTO carlog
      VALUES (USER,'INSERT', SYSDATE,:NEW.serial);
   END IF;
   IF UPDATING THEN
      :new.serial:=UPPER(:new.serial);
      :new.make:=UPPER(:new.make);
	  :new.model:=UPPER(:new.model);
      :new.color:=UPPER(:new.color);
      INSERT INTO carlog
      VALUES (USER,'UPDATE', SYSDATE,:OLD.serial);
   END IF;
   IF DELETING THEN
      INSERT INTO carlog
      VALUES (USER,'DELETE', SYSDATE,:OLD.serial);
   END IF;
END;
/