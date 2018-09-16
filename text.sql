CREATE USER "chirprapp"@"localhost" IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL ON mysql_firstlab.* TO "chirprapp"@"localhost";

delimiter //
CREATE PROCEDURE spUserMentions (userid int)
BEGIN
    SELECT c.id, c.text, c._created 
        FROM users u 
        JOIN Mentions m ON m.user_id=u.id 
        JOIN chirps c ON c.id=m.chirp_id
        WHERE u.id = userid;
END //
delimiter ;