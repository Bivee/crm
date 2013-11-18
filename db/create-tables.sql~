
/**
* Create All Tables
* @author dvinciguerra
*/

CREATE TABLE "activity" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "user" INTEGER NOT NULL DEFAULT (0),
    "action" TEXT NOT NULL,
    "type" TEXT,
    "created" DATETIME
);

CREATE TABLE "champaign" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT,
    "start" DATETIME,
    "finish" DATETIME,	
    "finished" INTEGER DEFAULT (0),
    "type" TEXT,
    "cost" INTEGER,
    "updated" DATETIME,
    "created" DATETIME
);

CREATE TABLE "contact" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "job" TEXT,
    "company" TEXT,
    "street" TEXT,
    "city" TEXT,
    "state" TEXT,
    "zip" TEXT,
    "type" TEXT,
    "email" TEXT,
    "website" TEXT,
    "phone" TEXT,
    "mobile" TEXT,
    "active" INTEGER DEFAULT(1),
    "author" INTEGER DEFAULT(0),
    "updated" DATETIME,
    "created" DATETIME
);

CREATE TABLE "menu" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "position" INTEGER,
    "controller" TEXT,
    "action" TEXT,
    "url" TEXT,
    "active" INTEGER DEFAULT (1),
    "created" DATETIME
);

CREATE TABLE "note" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "tags" TEXT,
    "author" INTEGER NOT NULL,
    "updated" DATETIME,
    "created" DATETIME
);

CREATE TABLE "project" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT,
    "start" DATETIME,
    "finish" DATETIME,	
    "finished" INTEGER DEFAULT (0),
    "cost" INTEGER,
    "updated" DATETIME,
    "created" DATETIME
);

CREATE TABLE "task" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "date" DATETIME DEFAULT (NULL),
    "project" INTEGER DEFAULT (0),
    "tags" TEXT DEFAULT (NULL),
    "assigned" INTEGER DEFAULT (0),
    "author" INTEGER NOT NULL,
    "finished" INTEGER DEFAULT (0),
    "updated" DATETIME,
    "created" DATETIME
);

CREATE TABLE "user" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" varchar DEFAULT(NULL),
    "image" TEXT,
    "lang" TEXT DEFAULT('en'),
    "about" TEXT,
    "token" TEXT DEFAULT(NULL),
    "change" DATETIME DEFAULT(NULL),
    "active" TEXT DEFAULT(1),
    "created" DATETIME
);



