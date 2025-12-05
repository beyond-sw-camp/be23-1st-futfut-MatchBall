DELIMITER //

CREATE PROCEDURE 구장조회 (
    IN searchName VARCHAR(255)
)
BEGIN
    SELECT
        s.ID AS stadiumID,
        s.name AS stadiumName,
        s.location,
        s.max_count,
        s.condition_text,
        GROUP_CONCAT(so.name SEPARATOR ', ') AS options
    FROM stadium s
             LEFT JOIN stadium_detail_option sdo ON s.ID = sdo.stadiumID
             LEFT JOIN stadium_option so ON sdo.optionID = so.ID
    WHERE s.name LIKE CONCAT('%', searchName, '%')
    GROUP BY s.ID, s.name, s.location, s.max_count, s.condition_text
    ORDER BY s.ID;
END //

DELIMITER ;
