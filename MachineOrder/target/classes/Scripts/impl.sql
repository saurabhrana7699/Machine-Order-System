
INSERT INTO  mo_user (NAME, USERNAME,PASSWORD,ROLE_ID,ACTIVE) VALUES
('Tony','ironman','','ROLE_ADMIN',1),('steve','Captain','' , 'ROLE_REGULAR',1);

			
INSERT INTO mo_role(ROLE_ID, ROLE_DESC) VALUES 
('ROLE_ADMIN','Super user'),('ROLE_REGULAR','Regular User');

			

INSERT INTO mo_role_business_function(ROLE_ID, BUSINESS_FUNCTION_ID) VALUES ('ROLE_ADMIN','ROLE_BF_MANAGE_USER'),('ROLE_ADMIN','ROLE_BF_SHOW_HOME');	


INSERT INTO mo_business_function (BUSINESS_FUNCTION_ID, BUSINESS_FUNCTION_DESC) VALUES ('ROLE_BF_MANAGE_USER',' Have All Page Access'),('ROLE_BF_REGULAR_USER','Acess limited Pages'),

 ('ROLE_BF_SHOW_HOME',' Have Index Page Access');


SELECT u1.* from( select u.USER_ID, u.NAME, u.USERNAME, u.PASSWORD, u.ACTIVE, r.ROLE_ID, r.ROLE_DESC, 
GROUP_CONCAT(rbf.BUSINESS_FUNCTION_ID) BUSINESS_FUNCTION_IDS 
FROM mo_user u
LEFT JOIN mo_role r ON u.ROLE_ID = r.ROLE_ID
LEFT JOIN mo_role_business_function rbf ON r.ROLE_ID = rbf.ROLE_ID
GROUP BY u.USER_ID);


SELECT u1.* FROM (SELECT 
            u.USER_ID, u.NAME, u.USERNAME, u.PASSWORD, u.ACTIVE, r.ROLE_ID, r.ROLE_DESC, 
            GROUP_CONCAT(rbf.BUSINESS_FUNCTION_ID) `BUSINESS_FUNCTION_IDS` 
            FROM mo_user u 
            LEFT JOIN mo_role r ON u.ROLE_ID=r.ROLE_ID 
           LEFT JOIN mo_role_business_function rbf ON r.ROLE_ID=rbf.ROLE_ID 
            group by u.USER_ID ) AS u1 WHERE TRUE;


UPDATE mo_user u  SET  u.NAME=:name,u.USERNAME=:username,  WHERE u.USER_ID=:userId;




SELECT r.ROLE_ID `ID`, r.ROLE_DESC `LABEL` FROM mo_role r;





SELECT u1.* 
FROM (
    SELECT 
        u.USER_ID, 
        u.NAME, 
        u.USERNAME, 
        u.PASSWORD, 
        u.ACTIVE, 
        r.ROLE_ID, 
        r.ROLE_DESC,
        GROUP_CONCAT(rbf.BUSINESS_FUNCTION_ID) AS BUSINESS_FUNCTION_IDS
    FROM 
        mo_user u
    LEFT JOIN 
        mo_role r ON u.ROLE_ID = r.ROLE_ID
    LEFT JOIN 
        mo_role_business_function rbf ON r.ROLE_ID = rbf.ROLE_ID
    GROUP BY 
        u.USER_ID
       
) AS u1 
WHERE TRUE;






INSERT INTO mo_items ( LEVEL, CODE, ITEM_DESCRIPTION, NEXT_LEVEL) VALUES
( 0, 'A', 'AC PowerPack', 1),
( 0, 'D', 'DC PowerPack', 2),
( 1, 'T', '3 Phase AC Motor', 4),
( 1, 'S', '1 Phase AC Motor', 3),
( 2, '12', '12 V', 5),
( 2, '24', '24 V', 6),
( 3, 'S4037', '4 Pole, 0.37 Kw', 8),
( 3, 'S4075', '4 Pole, 0.75 Kw', 8),
( 3, 'S4110', '4 Pole, 1.1 Kw', 8),
( 3, 'S2110', '2 Pole, 1.1 Kw', 8),
( 3, 'S4150', '4 Pole, 1.5 Kw', 8),
( 3, 'S4220', '4 Pole, 2.2 Kw', 8),
( 4, 'T4037', '4 Pole, 0.37 Kw', 8),
( 4, 'T4075', '4 Pole, 0.75 Kw', 8),
( 4, 'T4110', '4 Pole, 1.1 Kw', 8),
( 4, 'T2110', '2 Pole, 1.1 Kw', 8),
( 4, 'T4150', '4 Pole, 1.5 Kw', 8),
( 4, 'T4220', '4 Pole, 2.2 Kw', 8),
( 5, 'D1208', '800 Watt, 3000 RPM, 7% S2', 7),
( 5, 'D1212', '1200 Watt, 2400 RPM, 4.5% S2', 7),
( 5, 'D1216', '1600 Watt, 2500 RPM, 8% S2', 7),
( 6, 'D2408', '800 Watt, 3000 RPM, 7% S2', 7),
( 6, 'D2422', '2200 Watt, 2600 RPM, 8% S2', 7),
( 6, 'D2430', '3000 Watt, 2600 RPM, 9% S2', 7),
( 6, 'F2430', '3000 Watt, 3100 RPM, 13% S2', 7),
( 6, 'L2430', '3000 Watt, 3100 RPM, 9% S2', 7),
( 7, '', 'Relay', 8),
( 7, '', 'Without Relay', 8),
( 8, 'U1', 'U1', 9),
( 8, 'U2', 'U2', 9),
( 8, 'U3', 'U3', 17),
( 8, 'U4', 'U4', 17),
( 8, 'U5', 'U5', 10),
( 8, 'U6', 'U6', 11),
( 9, 'S', '10 - 160 bar', 17),
( 9, 'N', '50 - 180 bar', 17),
( 9, 'B', '100 - 290 bar', 17),
( 10, 'S', '10 - 160 bar', 12),
( 10, 'N', '50 - 180 bar', 12),
( 10, 'B', '100 - 290 bar', 12),
( 11, 'S', '10 - 160 bar', 13),
( 11, 'N', '50 - 180 bar', 13),
( 11, 'B', '100 - 290 bar', 13),
( 12, 'PS', 'Plugged Single Acting', 14),
( 12, 'PD', 'Plugged Double Acting', 14),
( 12, 'SC', 'Single Poppet Normally Closed', 14),
( 12, 'SO', 'Single Poppet Normally Open', 14),
( 12, 'SD', 'Double Poppet Normally Closed', 14),
( 13, 'PS', 'Plugged Single Acting', 15),
( 13, 'PD', 'Plugged Double Acting', 15),
( 13, 'SC', 'Single Poppet Normally Closed', 15),
( 13, 'SO', 'Single Poppet Normally Open', 15),
( 13, 'SD', 'Double Poppet Normally Closed', 15),
( 14, 'XXX', 'Without Power', 17),
( 14, 'D12', 'DC 12 V', 17),
( 14, 'D24', 'DC 24 V', 17),
( 14, 'A11', 'AC 110 V', 17),
( 14, 'A23', 'AC 230 V', 17),
( 14, 'A24', 'AC 24 V DC', 17),
( 15, 'XXX', 'Without Power', 16),
( 15, 'D12', 'DC 12 V', 16),
( 15, 'D24', 'DC 24 V', 16),
( 15, 'A11', 'AC 110 V', 16),
( 15, 'A23', 'AC 230 V', 16),
( 15, 'A24', 'AC 24 V DC', 16),
( 16, 'X', 'Without Flow', 17),
( 16, 'A', 'Adjustable Flow', 17),
( 16, 'B', '2 LPM', 17),
( 16, 'C', '3 LPM', 17),
( 16, 'D', '4 LPM', 17),
( 16, 'F', '6 LPM', 17),
( 16, 'H', '8 LPM', 17),
( 16, 'J', '10 LPM', 17),
( 16, 'L', '12 LPM', 17),
( 16, 'O', '15 LPM', 17),
( 17, '13', '1.3 cc/rev', 18),
( 17, '16', '1.6 cc/rev', 18),
( 17, '23', '2.3 cc/rev', 18),
( 17, '27', '2.7 cc/rev', 18),
( 17, '32', '3.2 cc/rev', 18),
( 17, '37', '3.7 cc/rev', 18),
( 17, '42', '4.2 cc/rev', 18),
( 17, '58', '5.8 cc/rev', 18),
( 17, '70', '7 cc/rev', 18),
( 17, '80', '8 cc/rev', 18),
( 18, 'X', 'No Tank', 21),
( 18, 'P', 'Plastic Tank', 19),
( 18, 'S', 'Steel Tank', 20),
( 19, '*03', '3 Lt. Square', 21),
( 19, '*05', '5 Lt. Square', 21),
( 20, '*05', '5 Lt. Round', 21),
( 20, '*08', '8 Lt. Round', 21),
( 20, '12', '12 Lt. Square Horizontal', 21),
( 20, '12', '12 Lt. Square Vertical', 21),
( 20, '15', '15 Lt. Square Horizontal', 21),
( 20, '15', '15 Lt. Square Vertical', 21),
( 20, '25', '25 Lt. Square Horizontal', 21),
( 20, '25', '25 Lt. Square Vertical', 21),
( 21, 'SV', 'SAVE', NULL);

INSERT INTO items (ITEM_ID, LEVEL, CODE, ITEM_DESCRIPTION, NEXT_LEVEL) VALUES (99, 21, 'SV', 'SAVE', NULL);

INSERT INTO mo_order_status
(ORDER_STATUS_DESC) VALUES 
('ORDER PLACED'),
('ORDER CANCELLED'),
('ORDER COMPLETED');


        SELECT  a.ORDER_ID, p.USER_ID, p.NAME `USER_NAME`,  
         a.CODE, s.ORDER_STATUS_ID, s.ORDER_STATUS_DESC, 
        a.ORDER_DATE FROM mo_order a LEFT JOIN mo_user p ON a.USER_ID=p.USER_ID 
           LEFT JOIN mo_order_status s ON a.ORDER_STATUS_ID=s.ORDER_STATUS_ID 
            WHERE TRUE 


UPDATE mo_order  SET CODE  WHERE ORDER_ID=orderId;



SELECT u1.* FROM ( SELECT   u.USER_ID,      
    u.NAME,          u.USERNAME,          u.PASSWORD,      
    u.ACTIVE,          r.ROLE_ID,              
    GROUP_CONCAT(rbf.BUSINESS_FUNCTION_ID) AS BUSINESS_FUNCTION_IDS   
  FROM          mo_user u     LEFT JOIN         mo_role r ON u.ROLE_ID = r.ROLE_ID  
   LEFT JOIN         mo_role_business_function rbf ON r.ROLE_ID = rbf.ROLE_ID     GROUP BY   
      u.USER_ID ) AS u1 WHERE TRUE AND u1.USERNAME='ironman';