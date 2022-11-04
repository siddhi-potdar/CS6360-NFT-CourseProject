create table Trader(
    client_id varchar(255),
    ethereum_address uint(256) UNIQUE,
    first_name varchar(255),
    last_name varchar(255),
    phone_no varchar(30),
    cell_no varchar(30),
    email varchar(255),
    street_address varchar(255),
    zip_code varchar(30),
    login varchar(255) UNIQUE,
    level char(1),
    fiat_balance double,
    ethereum_balance double,
    primary key(client_id),
    foreign key(street_address, zip_code) references Address(street_address, zip_code),
    foreign key(login) references User(login)
    on delete no action
);

create table Address(
    street_address varchar(255),
    city varchar(255),
    state varchar(30),
    zip_code varchar(30),
    primary key(street_address, zip_code),
);

create table NFT(
    ethereum_address uint(256),
    name varchar(255),
    owner_id varchar(255),
    market_value double,
    primary key(token_id),
    foreign key(owner_id) references Trader(client_id),
    on delete no action
);

create table Payment(
    payment_id varchar(255),
    client_id varchar(255),
    payment_type varchar(1),
    payment_address varchar(255),
    amount_paid double,
    cancelled boolean,
    date date
    primary key(payment_id),
    foreign key(client_id) references Trader(client_id),
    on delete no action
);

create table User(
    login varchar(255),
    password varchar(255),
    primary key(login)
);

create table Manager(
    manager_id varchar(255),
    login varchar(255),
    primary key(manager_id),
    foreign key(login) references User(login)
);

create table Transaction(
    transaction_id varchar(255), 
    ethereum_value varchar(255), 
    ethereum_buyer_address varchar(255),
    ethereum_seller_address varchar(255),
    token_id varchar(255),
    ethereum_nft_address varchar(255),
    commission_type double,
    commission_paid double,
    date date
    primary key(transaction_id),
    foreign key(ethereum_buyer_address) references Trader(ethereum_address)
    foreign key(ethereum_seller_address) references Trader(ethereum_address)
);