CREATE TABLE webos_poll_questions(
QuestionID int IDENTITY(1,1) NOT NULL,
Question varchar(1050) NULL
) 

CREATE TABLE webos_poll_answers(
AnswerID int IDENTITY(1,1) NOT NULL,
QuestionID int NULL,
Answer varchar(850) NULL,
Votes int NULL
) 