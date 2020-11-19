CREATE TABLE "Album"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "PK_Album" PRIMARY KEY  ("AlbumId")
);

CREATE TABLE "Artist"
(
    "ArtistId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_Artist" PRIMARY KEY  ("ArtistId")
);

CREATE TABLE "Customer"
(
    "CustomerId" INT NOT NULL,
    "FirstName" VARCHAR(40) NOT NULL,
    "LastName" VARCHAR(20) NOT NULL,
    "Company" VARCHAR(80),
    "Address" VARCHAR(70),
    "City" VARCHAR(40),
    "State" VARCHAR(40),
    "Country" VARCHAR(40),
    "PostalCode" VARCHAR(10),
    "Phone" VARCHAR(24),
    "Fax" VARCHAR(24),
    "Email" VARCHAR(60) NOT NULL,
    "SupportRepId" INT,
    CONSTRAINT "PK_Customer" PRIMARY KEY  ("CustomerId")
);

CREATE TABLE "Employee"
(
    "EmployeeId" INT NOT NULL,
    "LastName" VARCHAR(20) NOT NULL,
    "FirstName" VARCHAR(20) NOT NULL,
    "Title" VARCHAR(30),
    "ReportsTo" INT,
    "BirthDate" TIMESTAMP,
    "HireDate" TIMESTAMP,
    "Address" VARCHAR(70),
    "City" VARCHAR(40),
    "State" VARCHAR(40),
    "Country" VARCHAR(40),
    "PostalCode" VARCHAR(10),
    "Phone" VARCHAR(24),
    "Fax" VARCHAR(24),
    "Email" VARCHAR(60),
    CONSTRAINT "PK_Employee" PRIMARY KEY  ("EmployeeId")
);

CREATE TABLE "Genre"
(
    "GenreId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_Genre" PRIMARY KEY  ("GenreId")
);

CREATE TABLE "Invoice"
(
    "InvoiceId" INT NOT NULL,
    "CustomerId" INT NOT NULL,
    "InvoiceDate" TIMESTAMP NOT NULL,
    "BillingAddress" VARCHAR(70),
    "BillingCity" VARCHAR(40),
    "BillingState" VARCHAR(40),
    "BillingCountry" VARCHAR(40),
    "BillingPostalCode" VARCHAR(10),
    "Total" NUMERIC(10,2) NOT NULL,
    CONSTRAINT "PK_Invoice" PRIMARY KEY  ("InvoiceId")
);

CREATE TABLE "InvoiceLine"
(
    "InvoiceLineId" INT NOT NULL,
    "InvoiceId" INT NOT NULL,
    "TrackId" INT NOT NULL,
    "UnitPrice" NUMERIC(10,2) NOT NULL,
    "Quantity" INT NOT NULL,
    CONSTRAINT "PK_InvoiceLine" PRIMARY KEY  ("InvoiceLineId")
);

CREATE TABLE "MediaType"
(
    "MediaTypeId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_MediaType" PRIMARY KEY  ("MediaTypeId")
);

CREATE TABLE "Playlist"
(
    "PlaylistId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_Playlist" PRIMARY KEY  ("PlaylistId")
);

CREATE TABLE "PlaylistTrack"
(
    "PlaylistId" INT NOT NULL,
    "TrackId" INT NOT NULL,
    CONSTRAINT "PK_PlaylistTrack" PRIMARY KEY  ("PlaylistId", "TrackId")
);

CREATE TABLE "Track"
(
    "TrackId" INT NOT NULL,
    "Name" VARCHAR(200) NOT NULL,
    "AlbumId" INT,
    "MediaTypeId" INT NOT NULL,
    "GenreId" INT,
    "Composer" VARCHAR(220),
    "Milliseconds" INT NOT NULL,
    "Bytes" INT,
    "UnitPrice" NUMERIC(10,2) NOT NULL,
    CONSTRAINT "PK_Track" PRIMARY KEY  ("TrackId")
);



/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE "Album" ADD CONSTRAINT "FK_AlbumArtistId"
    FOREIGN KEY ("ArtistId") REFERENCES "Artist" ("ArtistId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_AlbumArtistId" ON "Album" ("ArtistId");

ALTER TABLE "Customer" ADD CONSTRAINT "FK_CustomerSupportRepId"
    FOREIGN KEY ("SupportRepId") REFERENCES "Employee" ("EmployeeId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_CustomerSupportRepId" ON "Customer" ("SupportRepId");

ALTER TABLE "Employee" ADD CONSTRAINT "FK_EmployeeReportsTo"
    FOREIGN KEY ("ReportsTo") REFERENCES "Employee" ("EmployeeId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_EmployeeReportsTo" ON "Employee" ("ReportsTo");

ALTER TABLE "Invoice" ADD CONSTRAINT "FK_InvoiceCustomerId"
    FOREIGN KEY ("CustomerId") REFERENCES "Customer" ("CustomerId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_InvoiceCustomerId" ON "Invoice" ("CustomerId");

ALTER TABLE "InvoiceLine" ADD CONSTRAINT "FK_InvoiceLineInvoiceId"
    FOREIGN KEY ("InvoiceId") REFERENCES "Invoice" ("InvoiceId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_InvoiceLineInvoiceId" ON "InvoiceLine" ("InvoiceId");

ALTER TABLE "InvoiceLine" ADD CONSTRAINT "FK_InvoiceLineTrackId"
    FOREIGN KEY ("TrackId") REFERENCES "Track" ("TrackId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_InvoiceLineTrackId" ON "InvoiceLine" ("TrackId");

ALTER TABLE "PlaylistTrack" ADD CONSTRAINT "FK_PlaylistTrackPlaylistId"
    FOREIGN KEY ("PlaylistId") REFERENCES "Playlist" ("PlaylistId") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "PlaylistTrack" ADD CONSTRAINT "FK_PlaylistTrackTrackId"
    FOREIGN KEY ("TrackId") REFERENCES "Track" ("TrackId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_PlaylistTrackTrackId" ON "PlaylistTrack" ("TrackId");

ALTER TABLE "Track" ADD CONSTRAINT "FK_TrackAlbumId"
    FOREIGN KEY ("AlbumId") REFERENCES "Album" ("AlbumId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_TrackAlbumId" ON "Track" ("AlbumId");

ALTER TABLE "Track" ADD CONSTRAINT "FK_TrackGenreId"
    FOREIGN KEY ("GenreId") REFERENCES "Genre" ("GenreId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_TrackGenreId" ON "Track" ("GenreId");

ALTER TABLE "Track" ADD CONSTRAINT "FK_TrackMediaTypeId"
    FOREIGN KEY ("MediaTypeId") REFERENCES "MediaType" ("MediaTypeId") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "IFK_TrackMediaTypeId" ON "Track" ("MediaTypeId");


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO "Genre" ("GenreId", "Name") VALUES (1, N'Rock');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (2, N'Jazz');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (3, N'Metal');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (4, N'Alternative & Punk');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (5, N'Rock And Roll');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (6, N'Blues');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (7, N'Latin');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (8, N'Reggae');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (9, N'Pop');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (10, N'Soundtrack');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (11, N'Bossa Nova');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (12, N'Easy Listening');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (13, N'Heavy Metal');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (14, N'R&B/Soul');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (15, N'Electronica/Dance');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (16, N'World');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (17, N'Hip Hop/Rap');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (18, N'Science Fiction');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (19, N'TV Shows');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (20, N'Sci Fi & Fantasy');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (21, N'Drama');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (22, N'Comedy');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (23, N'Alternative');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (24, N'Classical');
INSERT INTO "Genre" ("GenreId", "Name") VALUES (25, N'Opera');

INSERT INTO "MediaType" ("MediaTypeId", "Name") VALUES (1, N'MPEG audio file');
INSERT INTO "MediaType" ("MediaTypeId", "Name") VALUES (2, N'Protected AAC audio file');
INSERT INTO "MediaType" ("MediaTypeId", "Name") VALUES (3, N'Protected MPEG-4 video file');
INSERT INTO "MediaType" ("MediaTypeId", "Name") VALUES (4, N'Purchased AAC audio file');
INSERT INTO "MediaType" ("MediaTypeId", "Name") VALUES (5, N'AAC audio file');

INSERT INTO "Artist" ("ArtistId", "Name") VALUES (1, N'AC/DC');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (2, N'Accept');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (3, N'Aerosmith');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (4, N'Alanis Morissette');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (5, N'Alice In Chains');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (6, N'Ant�nio Carlos Jobim');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (7, N'Apocalyptica');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (8, N'Audioslave');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (9, N'BackBeat');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (10, N'Billy Cobham');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (11, N'Black Label Society');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (12, N'Black Sabbath');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (13, N'Body Count');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (14, N'Bruce Dickinson');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (15, N'Buddy Guy');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (16, N'Caetano Veloso');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (17, N'Chico Buarque');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (18, N'Chico Science & Na��o Zumbi');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (19, N'Cidade Negra');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (20, N'Cl�udio Zoli');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (21, N'Various Artists');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (22, N'Led Zeppelin');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (23, N'Frank Zappa & Captain Beefheart');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (24, N'Marcos Valle');