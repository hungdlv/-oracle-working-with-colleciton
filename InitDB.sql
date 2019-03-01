CREATE TABLE SINHVIENS (
	sv_id  NUMBER  NOT NULL PRIMARY KEY,
    sv_fullname  VARCHAR2(200) NOT NULL,
    sv_address VARCHAR2(500) NOT NULL  
);
						
CREATE TABLE THETHUVIENS (
	ttv_id NUMBER NOT NULL PRIMARY KEY,
	ttv_sv_id NUMBER NOT NULL,
	ttv_bal NUMBER(10,2),
	CONSTRAINT ttv_sv_fk FOREIGN KEY (ttv_sv_id) REFERENCES  
	SINHVIENS(sv_id)
);                     

CREATE TABLE SACHS (
	sach_id  NUMBER  NOT NULL PRIMARY KEY,
	sach_name  VARCHAR2(500) NOT NULL,
	sach_value number(10,2) NOT NULL  
);
                       
CREATE TABLE MUONSACHS  ( 
	ms_id  NUMBER  NOT NULL PRIMARY KEY,
    ms_sach_id   NUMBER NOT NULL,
	ms_ttv_id    NUMBER NOT NULL ,
	CONSTRAINT ms_sach_fk FOREIGN KEY (ms_sach_id) REFERENCES  
	SACHS(sach_id),
	CONSTRAINT  ms_ttv_fk FOREIGN KEY (ms_ttv_id) REFERENCES  
	THETHUVIENS(ttv_id) 
);

CREATE SEQUENCE ms_seq START WITH 1 INCREMENT BY 1;

-- Insert into SINHVIENS table
INSERT INTO SINHVIENS(sv_id,sv_fullname,sv_address) VALUES (1,'Teo','Quan 1');
INSERT INTO SINHVIENS(sv_id,sv_fullname,sv_address) VALUES (2,'Ty','Quan 2');
INSERT INTO SINHVIENS(sv_id,sv_fullname,sv_address) VALUES (3,'Tun','Quan 3');

-- Insert into THETHUVIENS table
INSERT INTO THETHUVIENS(ttv_id,ttv_sv_id,ttv_bal) VALUES (1,1,1000000);
INSERT INTO THETHUVIENS(ttv_id,ttv_sv_id,ttv_bal) VALUES (2,2,1550000);
INSERT INTO THETHUVIENS(ttv_id,ttv_sv_id,ttv_bal) VALUES (3,3,2500000);

-- Insert into SACHS table
INSERT INTO SACHS(sach_id,sach_name,sach_value) VALUES (1,'LAP TRINH CSHAP', 5000);
INSERT INTO SACHS(sach_id,sach_name,sach_value) VALUES (2,'TRIET HOC LENIN', 6000);
INSERT INTO SACHS(sach_id,sach_name,sach_value) VALUES (3,'LAP TRINH SQL', 1000);

INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 1,1);
INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 2,1);
INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 2,2);
INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 3,1);
INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 3,2);
INSERT INTO MUONSACHS(ms_id,ms_sach_id,ms_ttv_id) VALUES (ms_seq.NEXTVAL, 3,3);
COMMIT;

