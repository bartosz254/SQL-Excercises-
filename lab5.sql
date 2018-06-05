clear screen;
CREATE or REPLACE PROCEDURE pSEQ_PROD_STR_insert(
	P_NAME 		IN PRODUCTS.PROD_NAME%TYPE,
	P_CAT		IN CATEGORIES.CATk_1_ID%TYPE,
	P_PRICE 	IN PRODUCTS.PRODk_1_PRICE%TYPE,
	P_GALLERY 	IN PRODUCTS.GAL_ID%TYPE
	)
	IS
		P_ID	PRODUCTS.PRODk_1_ID%TYPE;
		W_ID	WEBSITES.WEB_ID%TYPE;
		C_ID	XXX_CAT_PROD.XXX_CAT_PROD_ID%TYPE;
		PRAGMA AUTONOMOUS_TRANSACTION;
	BEGIN
			SELECT SEQ_WEBSITES.nextval INTO W_ID FROM dual;
			--
			INSERT INTO WEBSITES(WEB_NAME, WEB_DESCRIPTION, WEBk_1_LINK, SLI_ID, MENU_ID)
			VALUES('SHOP_'||P_NAME, 'descritpion of '||P_NAME, 'SHOP_'||P_NAME||'_'||P_ID, '1', '1');
			--
			SELECT SEQ_WEBSITES.currval INTO W_ID FROM dual;
			--
			SELECT SEQ_PRODUCTS.nextval INTO P_ID FROM dual;
			--
			INSERT INTO PRODUCTS(PROD_NAME, PRODk_1_PRICE, WEB_LINK, GAL_ID)
			VALUES (P_NAME, P_PRICE, 'SHOP_'||P_NAME||'_'||P_ID, P_GALLERY);
			--
			SELECT SEQ_PRODUCTS.currval INTO P_ID FROM dual;
			
			--
			INSERT INTO XXX_CAT_PROD(CAT_ID, PROD_ID)
			VALUES (P_CAT,P_ID);

			--
			COMMIT;
	END;
/
exec pSEQ_PROD_STR_insert('adidasy', 1, 2, 1);