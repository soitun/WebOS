CREATE TABLE webos_stock_symbols(
stockid int NOT NULL,
symbolid int NOT NULL,
symbol varchar(50) NULL,
companyname varchar(50) NULL)

CREATE TABLE webos_stock_tickers(
ticker_id int IDENTITY(1,1) NOT NULL,
ticker_company varchar(50) NULL,
ticker_symbol varchar(50) NULL)