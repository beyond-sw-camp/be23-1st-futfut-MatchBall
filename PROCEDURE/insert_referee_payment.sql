DELIMITER //

CREATE PROCEDURE 심판정산입력(IN rID BIGINT)
BEGIN
    DECLARE fee INT;
    DECLARE calcPayment INT;

    -- 심판 수수료율 조회
    SELECT fee_rate INTO fee
    FROM referee
    WHERE ID = rID;

    -- 고정금액 20000원에서 수수료 계산
    -- 수수료만큼 제외: payment = 20000 * (100 - fee_rate) / 100
    SET calcPayment = ROUND(20000 * (100 - fee) / 100);

    -- 정산 테이블에 저장
    INSERT INTO referee_payment (refereeID, paymentDate, payment)
    VALUES (rID, CURRENT_TIMESTAMP, calcPayment);
END //

DELIMITER ;
