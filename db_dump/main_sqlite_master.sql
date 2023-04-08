INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'Company', 'Company', 2,
        'CREATE TABLE Company(company_id int NOT NULL PRIMARY KEY,company_name varchar(255),industry varchar(255),notes varchar(255))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_Company_1', 'Company', 3, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'Reminders', 'Reminders', 4,
        'CREATE TABLE Reminders(reminder_id int NOT NULL PRIMARY KEY,date_time varchar(255),notes varchar(255))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_Reminders_1', 'Reminders', 5, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'Contact', 'Contact', 6,
        'CREATE TABLE Contact(contact_id int NOT NULL PRIMARY KEY,contact_name varchar(255),email varchar(255),phone_number int,job varchar(255),relationship_type varchar(255),notes varchar(255),company_id int,FOREIGN KEY(company_id) REFERENCES Company(company_id))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_Contact_1', 'Contact', 7, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'contact_acquaintances', 'contact_acquaintances', 10,
        'CREATE TABLE contact_acquaintances(contact_id int NOT NULL,acquaintance_id int NOT NULL,relationship_type varchar(255),PRIMARY KEY (contact_id, acquaintance_id),FOREIGN KEY(contact_id) REFERENCES Contact(contact_id),FOREIGN KEY(acquaintance_id) REFERENCES Contact(contact_id))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_contact_acquaintances_1', 'contact_acquaintances', 11, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'reminder_contact_map', 'reminder_contact_map', 12,
        'CREATE TABLE reminder_contact_map(contact_id int NOT NULL,reminder_id int NOT NULL,PRIMARY KEY (contact_id, reminder_id),FOREIGN KEY(contact_id) REFERENCES Contact(contact_id),FOREIGN KEY(reminder_id) REFERENCES Reminders(reminder_id))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_reminder_contact_map_1', 'reminder_contact_map', 13, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('table', 'Interactions', 'Interactions', 14, 'CREATE TABLE "Interactions"
(
    contact_id     int not null
        references Contact,
    interaction_id int not null,
    date_time      varchar(255),
    location       varchar(255),
    notes          varchar(255),
    primary key (contact_id, interaction_id)
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql)
VALUES ('index', 'sqlite_autoindex_Interactions_1', 'Interactions', 15, null);
